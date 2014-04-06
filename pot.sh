#!/bin/bash

TYPE=${1-'wp-plugin'}
SLUG=$(basename $(dirname $PWD))

# TODO: Make sure we are on the master branch
# export GIT_DIR=../git/.git
# git checkout -f master

php ./wp-develop/tools/i18n/makepot.php $TYPE ../git ../git/languages/$SLUG.pot
