#!/bin/bash

# Variables
USER="yourusername"
REPO_NAME="your-repository"
DESCRIPTION="This is your repository description"
PRIVATE=true    # Set to false if you want a public repository
TOKEN="your_github_token"

# Create a repository using GitHub API
curl -H "Authorization: token $TOKEN" \
     -d "{\"name\": \"$REPO_NAME\", \"description\": \"$DESCRIPTION\", \"private\": $PRIVATE}" \
     https://api.github.com/user/repos
     
