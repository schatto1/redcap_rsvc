#!/bin/bash

# Check if the GitHub CLI is installed
if ! command -v gh &> /dev/null; then
  echo "GitHub CLI (gh) is not installed. Please install it and try again."
  exit 1
fi

# GitHub repository (update with your repo, e.g., 'username/repo')
GITHUB_REPO="4bbakers/redcap_rsvc"

function url_encode() {
    echo "$@" \
    | sed \
        -e 's/ /%20/g'
}

branch='v14.7.0'

# For the following command:
# - We use awk to print the file because it will append a trailing newline if it is missing
# - We use 'tr -d "\r"' to remove carriage returns in case the file has been edited on Windows
awk 1 features.csv | tr -d "\r" | while read line; do
    file=$(find . | grep "$line")
    if [ -z "$file" ]; then
      echo "File not found matching '$line'.  Stopping..."
      exit
    fi

    # Extract file name without extension
    file_name=$(basename "$file" .feature)
    # Use the file path as the description
    file_url="https://github.com/4bbakers/redcap_rsvc/tree/$branch/$file"

    # Create a GitHub issue
    issue_url="$(gh issue create --repo "$GITHUB_REPO" --title "$file_name" --body "Feature: [$file_name]($(url_encode $file_url))" | grep https)"

    gh project item-add 2 --url $issue_url --owner vanderbilt-redcap

    echo "Issue created for: $file_name"

    sleep 10

done