#!/usr/bin/env node
const fs = require('fs')
const { exec } = require('child_process')

/**
 * This tool fetches the results of the latest cloud run
 * This will facilitate uploading the video results to the VUMC REDCap project via REDCap API
 * Ultimate goal is to have the videos push to the File Repo when a feature has been marked as passed
 */
class UploadVideosToREDCapProject {
    constructor() {
        const redcap_api_token = process.argv[2]
        if(!redcap_api_token){
            console.log('No REDCap API token found.')
            return
        }

        const project_id = process.argv[3]
        if(!project_id){
            console.log('No Project ID found.')
            return
        }

        this.cypress_cloud_query(
            {
                variables: {
                    projectId: project_id
                },
                query: `query GetLatestRun($projectId: String!) {
                            project(id: $projectId) {
                                runs {
                                    nodes {
                                        id
                                    }
                                }
                            }
                        }`
            },
        ).then((response) => {
            this.cypress_cloud_query({
                variables: {
                    input: {
                        runId: response.data.project.runs.nodes[0].id, //This is the first result returned from above
                    }
                },
                query: `query RunTestResults($input: TestResultsTableInput!) {
                          testResults(input: $input) {
                            __typename
                            ... on RunInstance {
                              status
                              spec {
                                path
                              }
                            }
                          }
                        }`
            }).then((response) => {

                const passed_features = []
                response.data.testResults.forEach((feature) => {
                    if (feature.__typename !== 'RunInstance') {
                        return
                    }

                    //If feature passed, upload to REDCap VUMC
                    if(feature.status === "PASSED"){
                        passed_features.push(`${feature.spec.path.replace(/redcap_rsvc\/Feature Tests/g, '/home/circleci/project/coverage/cypress/videos')}.mp4`)
                    }
                })

                //Get the Folder ID
                this.redcap_project_query(new URLSearchParams({
                    token: redcap_api_token, // Replace with actual token if not using environment variables
                    content: 'fileRepository',
                    action: 'list',
                    format: 'json',
                    returnFormat: 'json'
                })).then((response) => {

                    return new Promise((resolve, reject) => {
                        const folder = response.find(r => r.name === "Automated Videos");

                        if (folder) {
                            resolve(folder.folder_id)
                        } else {
                            reject('Automated Videos folder not found');
                        }
                    })

                }).then((folder_id) => {

                    this.redcap_project_query(new URLSearchParams({
                        token: redcap_api_token, // Replace with actual token if not using environment variables
                        content: 'fileRepository',
                        action: 'list',
                        folder_id: folder_id,
                        format: 'json',
                        returnFormat: 'json'
                    })).then((uploaded_feature_videos) =>{

                        //For each passed feature, let's upload if there isn't already a file
                        for(const feature of passed_features){
                            const path = feature.split('/')
                            const filename = path[path.length - 1]
                            const file_path = feature

                            //This means we already have uploaded it
                            if(uploaded_feature_videos.find(r => r.name === filename)){
                                console.log(`ALREADY UPLOADED: ${filename}`)
                                //This means we should upload it
                            } else {
                                console.log(`NEW UPLOAD: ${filename}`)
                                console.log(`FILE PATH: ${feature}`)

                                fs.access(file_path, fs.constants.F_OK, (err) => {
                                    if (err) {
                                        console.error(`File does not exist at path: ${file_path}`)
                                        return
                                    }

                                    //Run the import of video to REDCAP VUMC
                                    exec(`sh import_video_to_vumc_project.sh "${file_path}" "${filename}" ${folder_id}`,
                                        (error, stdout, stderr) => {
                                            if (error) {
                                                console.error(`Error executing script: ${error.message}`)
                                                return
                                            }
                                            if (stderr) {
                                                console.error(`stderr: ${stderr}`)
                                                return
                                            }
                                            console.log(`stdout: ${stdout}`)
                                        })

                                })

                                break
                            }

                        }
                    })
                })
            })
        })
    }

    cypress_cloud_query(payload) {
        return fetch("https://cloud.cypress.io/graphql", {
            method: "POST",
            body: JSON.stringify(payload),
            headers: {
                "Content-type": "application/json; charset=UTF-8"
            }
        }).then((response) => response.json())
    }

    redcap_project_query(payload, headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',
    }) {
        return  fetch('https://redcap.vumc.org/api/', {
            method: 'POST',
            headers: headers,
            body: payload
        }).then(response => response.json())  // Parse the JSON response
            .catch(error => console.error('Error:', error));  // Handle errors
    }

}

new UploadVideosToREDCapProject()