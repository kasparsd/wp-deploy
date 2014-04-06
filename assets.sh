#!/bin/bash
 
SLUG=$(basename $(dirname $PWD))

# Checkout the assets branch
export GIT_DIR=../git/.git

assets_exist=`git show-ref refs/heads/assets`

# Make sure that the assets branch exist
if [ ! -n "$assets_exist" ]; then
    echo "Couldn't find the assets branch in your Git repository!"
	exit
fi

git checkout -f assets
git push

./deploy.sh "Update assets" assets

