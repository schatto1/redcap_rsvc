#!/bin/sh
CURL=`which curl`

VIDEO_FILE=$1
FILENAME=$2
FOLDER_ID=$3

# Load environment variables from .env file
if [ -f .env ]; then
  source .env
fi

if [ -z "$REDCAP_API_TOKEN" ]; then
  echo "Environment variable REDCAP_API_TOKEN is not set. Exiting."
  exit 1
fi

#Upload the Video file to the REDCap project
$CURL -H "Accept: application/json" \
      -F "token=$REDCAP_API_TOKEN" \
      -F "content=fileRepository" \
      -F "action=import" \
      -F "folder_id=$FOLDER_ID" \
      -F "filename=$FILENAME" \
      -F "file=@\"$VIDEO_FILE\"" \
      $REDCAP_API_URL