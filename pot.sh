#!/bin/bash

TYPE=${1-'wp-plugin'}
SLUG=$(basename $(dirname $PWD))

# These are needed because this itself is a Git repo
export GIT_WORK_TREE=../git
export GIT_DIR=../git/.git

git checkout -f master

php ./wp-develop/tools/i18n/makepot.php $TYPE ../git ../git/languages/$SLUG.pot
