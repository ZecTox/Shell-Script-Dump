#!/bin/bash

###############################
#
# AUTHOR: TEJAS KEDARE
#
# DATE: 9TH APRIL 2025
#
# INPUT WHILE EXECUTING: SH FILENAME.SH $REPO_USER $REPO_NAME
#
###############################

# GITHUB API URL

API_URL="https://api.github.com"

# GITHUB USERNAME AND PERSONAL ACCESS TOKEN | MAKE SURE THAT YOU HAVE USERNAME AND TOKEN IN EXPORT COMMAND
USERNAME=$username
TOKEN=$token

# USER AND REPOSITORY NAME
REPO_OWNER=$1
REPO_NAME=$2

# FUNCTION TO MAKE A GET REQUEST TO GITHUB API
function github_api_get {
    local endpoint=$1
    local url="${API_URL}/${endpoint}"

    # SEND A GET REQUEST TO THE GITHUB API WITH AUTHENTICATION
    curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

# FUNCTION TO LIST USERS WITH READ ACCESS TO THE REPOSITORY
function list_users_with_read_access {
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

    # FETCH THE LIST OF COLLABORATORS ON THE REPOSITORY
    response=$(github_api_get "$endpoint")

    # CHECK IF THE RESPONSE CONTAINS AN ERROR MESSAGE
    if [[ "$response" == *"message"* && "$response" == *"not found"* ]]; then
        echo "ERROR: REPOSITORY ${REPO_OWNER}/${REPO_NAME} NOT FOUND OR ACCESS DENIED."
        exit 1
    fi

    # PARSE THE RESPONSE USING JQ AND GET COLLABORATORS WITH READ ACCESS
    collaborators=$(echo "$response" | jq -r '.[] | select(.permissions.pull == true) | .login')

    # DISPLAY THE LIST OF COLLABORATORS WITH READ ACCESS
    if [[ -z "$collaborators" ]]; then 
        echo "NO USERS WITH READ ACCESS WERE FOUND FOR ${REPO_OWNER}/${REPO_NAME}."
    else
        echo "USERS WITH READ ACCESS TO ${REPO_OWNER}/${REPO_NAME}:"
        echo "$collaborators"
    fi
}

# MAIN SCRIPT
if [[ -z "$REPO_OWNER" || -z "$REPO_NAME" || -z "$USERNAME" || -z "$TOKEN" ]]; then
    echo "ERROR: MISSING REQUIRED ARGUMENTS OR GITHUB CREDENTIALS."
    echo "USAGE: SH SCRIPT.SH <REPO_OWNER> <REPO_NAME>"
    exit 1
fi

echo "LISTING USERS WITH READ ACCESS TO ${REPO_OWNER}/${REPO_NAME}..."
list_users_with_read_access
