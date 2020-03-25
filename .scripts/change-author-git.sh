#!/bin/bash

OLD_EMAIL=
CORRECT_EMAIL=
GITHUB_REPO_URL=
CORRECT_NAME=

while [ "$1" != "" ]; do
    case $1 in
        -n | --name )           shift
                                CORRECT_NAME=$1
                                ;;
        -r | --repo )           shift
                                GITHUB_REPO_URL=$1
                                ;;
        -o | --old )            shift
                                OLD_EMAIL=$1
                                ;;
        -n | --new )            shift
                                CORRECT_EMAIL=$1
                                ;;
    esac
    shift
done

# Determine the parent directory and the name of the
# new folder created during the clone process:
IFS='/'
read -ra ADDR <<< "$GITHUB_REPO_URL"
BARE_GIT_DIR=${ADDR[1]}
PARENT_DIR=`pwd`

# Clone the git repository in bare mode:
git clone --bare $GITHUB_REPO_URL


# Change to the new .git directory:
cd "$PARENT_DIR/$BARE_GIT_DIR"
pwd

# Modify the author information:
git filter-branch --env-filter '
if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags


# Push the corrected history to GitHub:
git push --force --tags origin 'refs/heads/*'


# Change to the parent directory and remove the local copy:
cd $PARENT_DIR
rm -rf $BARE_GIT_DIR
echo "[SUCCESS] Author updated on GitHub!"
exit 1
