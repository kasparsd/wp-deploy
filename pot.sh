#!/bin/bash

# set workind dir and include env setup
cd "$(dirname "$0")"
source setup-bash.sh

TYPE=${1-'wp-plugin'}

php "$BASEDIR/wp-deploy/wp-develop/tools/i18n/makepot.php" $TYPE "$GIT_WORK_TREE" "$GIT_WORK_TREE/languages/$SLUG.pot"
