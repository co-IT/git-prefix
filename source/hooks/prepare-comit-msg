#!/bin/sh

# setting up colors for console output
GREEN="$(git config --get-color "" "green")"
BOLD_GREEN="$(git config --get-color "" "bold green")"
RESET_COLOR="$(git config --get-color "" "reset")"

COMMIT_PREFIX=`printenv GIT_COMMIT_PREFIX`
COMMIT_MESSAGE=`cat "$1"`

# If an issue number exits it should be set
# before the commit message
if [ -n "$COMMIT_PREFIX" ]; then
  printf "\r\n${GREEN}Prefixing commit message with ${BOLD_GREEN}$COMMIT_PREFIX${RESET_COLOR}\r\n"
  echo "$COMMIT_PREFIX $COMMIT_MESSAGE" > "$1";
fi
