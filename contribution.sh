#!/bin/bash

# Set these before running
GIT_REPO_URL="https://github.com/shanhassan-ops/Test.git"
GIT_EMAIL="shahhassi87@gmail.com"  
GIT_NAME="shanhassan-ops"
COMMITS_PER_DAY=1  # You can make it 2–3 if you want thicker green

# Clone your repo and cd into it
git clone $GIT_REPO_URL
cd devops-implementation

git config user.name "$GIT_NAME"
git config user.email "$GIT_EMAIL"

# Create dummy file to commit on
touch activity.md

# Start date: 1 year ago
start_date=$(date -d "1 year ago" +%Y-%m-%d)

# Make commits for each day of the last year
for i in {0..364}; do
    for ((j=1; j<=$COMMITS_PER_DAY; j++)); do
        commit_date=$(date -d "$start_date + $i days" +"%Y-%m-%dT12:00:00")

        echo "Commit on $commit_date #$j" >> activity.md
        git add activity.md

        GIT_AUTHOR_DATE=$commit_date GIT_COMMITTER_DATE=$commit_date git commit -m "Dev Update on $commit_date"
    done
done

# Push to GitHub
git push origin main
