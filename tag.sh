#!/bin/bash

# set workind dir and include env setup
cd "$(dirname "$0")"
source setup-bash.sh

if [ $# -lt 1 ]; then
	echo 'usage: tag.sh 1.2.3'
	exit
fi

TAG_NAME=$1

./deploy.sh "Git tag $TAG_NAME" "tags/$TAG_NAME"
