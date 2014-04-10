#!/bin/bash
 
SLUG=$(basename $(dirname $PWD))

# These are needed because this itself is a Git repo
export GIT_WORK_TREE=$(dirname $PWD)/git
export GIT_DIR=$(dirname $PWD)/git/.git

assets_exist=`git show-ref refs/heads/assets`

# Make sure that the assets branch exist
if [ ! -n "$assets_exist" ]; then
    echo "Couldn't find the assets branch in your Git repository!"
	exit
fi

git checkout -f assets
git push

./deploy.sh "Update assets" assets

