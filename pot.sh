#!/bin/bash

TYPE=${1-'wp-plugin'}

BASEDIR=$( cd `dirname "$0"`/.. && pwd )
SLUG=$(basename $BASEDIR)

# These are needed because this itself is a Git repo
export GIT_WORK_TREE=${BASEDIR}/git
export GIT_DIR=${BASEDIR}/git/.git

git checkout -f master

php $BASEDIR/wp-deploy/wp-develop/tools/i18n/makepot.php $TYPE $GIT_WORK_TREE $GIT_WORK_TREE/languages/$SLUG.pot
