#!/bin/sh

# If a command fails then the deploy stops
set -e
set -x

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project.
hugo -D -d docs # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd docs
echo `pwd`

# Add changes to git.
echo git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
echo git commit -m "$msg"

# Push source and build repos.
echo git push origin master
