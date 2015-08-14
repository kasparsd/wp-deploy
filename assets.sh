#!/bin/bash

BASEDIR=$( cd `dirname "$0"`/.. && pwd )
SLUG=$(basename $BASEDIR)

# These are needed because this itself is a Git repo
export GIT_WORK_TREE=${BASEDIR}/git
export GIT_DIR=${BASEDIR}/git/.git

assets_exist=`git show-ref refs/heads/assets`

# Make sure that the assets branch exist
if [ ! -n "$assets_exist" ]; then
    echo "Couldn't find the assets branch in your Git repository!"
	exit
fi

git checkout -f assets
git push

./deploy.sh "Update assets" assets

