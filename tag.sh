#!/bin/bash
 
if [ $# -lt 1 ]; then
	echo 'usage: tag.sh 1.2.3'
	exit
fi
 
SLUG=$(basename $(dirname $PWD))
TAG_NAME=$1

export GIT_DIR=../git/.git
git checkout -f master
git tag $TAG_NAME
git push
git push --tags

./deploy.sh "Version $TAG_NAME" tags/$TAG_NAME

