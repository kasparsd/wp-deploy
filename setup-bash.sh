#!/bin/bash

BASEDIR=$(dirname "$(pwd)")
SLUG=$(basename $BASEDIR)

# These are needed because this itself is a Git repo
export GIT_WORK_TREE=${BASEDIR}/git
export GIT_DIR=${BASEDIR}/git/.git

# make sure we're deploying from the right dir
if [ ! -d "$BASEDIR/git/.git" ]; then
	echo "$BASEDIR doesn't seem to be a Git repository"
	exit
fi

# make sure the SVN repo exists
if [ ! -d "${BASEDIR}/svn" ]; then
	echo "Coudn't find the SVN repo at ${BASEDIR}/svn. Trying to create one..."
	svn co http://plugins.svn.wordpress.org/$SLUG/ ${BASEDIR}/svn
	exit
fi

# Check if there are any untracked changes
if [ -n "$(git status --porcelain)" ]; then
	echo "You have some unsaved changes in your Git repository!"
	exit
fi
