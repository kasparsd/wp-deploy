#!/bin/bash

# set workind dir and include env setup
cd "$(dirname "$0")"
source setup-bash.sh

# Make sure that the assets branch exist
if [ -z "$(git show-ref refs/heads/assets)" ]; then
    echo "Couldn't find the assets branch in your Git repository!"
	exit
fi

git checkout assets

./deploy.sh "Update assets" assets
