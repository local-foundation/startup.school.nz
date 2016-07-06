#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo

# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git pull --rebase
git push origin master
git subtree pull --squash --prefix=public git@github.com:startup-school-nz/startup.school.nz.github.io.git gh-pages
git subtree push --prefix=public git@github.com:startup-school-nz/startup.school.nz.github.io.git gh-pages
