#!/bin/bash
 
if [ $# -lt 1 ]; then
	echo 'usage: tag.sh 1.2.3'
	exit
fi

# args
TAG_NAME=$1

BASEDIR=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)
SLUG=$(basename $BASEDIR)

# These are needed because this itself is a Git repo
export GIT_WORK_TREE=${BASEDIR}/git
export GIT_DIR=${BASEDIR}/git/.git

git checkout -f master
git tag $TAG_NAME
git push
git push --tags

./deploy.sh "Version $TAG_NAME" tags/$TAG_NAME

