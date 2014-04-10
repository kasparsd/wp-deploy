#!/bin/bash

TYPE=${1-'wp-plugin'}
SLUG=$(basename $(dirname $PWD))

# These are needed because this itself is a Git repo
export GIT_WORK_TREE=$(dirname $PWD)/git
export GIT_DIR=$(dirname $PWD)/git/.git

git checkout -f master

php $PWD/wp-develop/tools/i18n/makepot.php $TYPE $GIT_WORK_TREE $GIT_WORK_TREE/languages/$SLUG.pot
