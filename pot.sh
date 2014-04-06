#!/bin/bash

SLUG=$(basename $(dirname $PWD))

# Make sure we are on the master branch
export GIT_DIR=../git/.git
git checkout -f master

php ./wp-develop/tools/i18n/makepot.php wp-plugin ../git ../git/languages/$SLUG.pot
