#!/bin/sh

# setting up colors for console output
CYAN='\033[0;36m'
BOLD_CYAN='\033[1;36m'
RESET_COLOR='\033[0m'

COMMIT_PREFIX=`printenv GIT_COMMIT_PREFIX`
COMMIT_MESSAGE=`cat "$1"`

# If an issue number exits it should be set
# before the commit message
if [ -n "$COMMIT_PREFIX" ]; then
  printf "\r\n${CYAN}Prefixing commit message with ${BOLD_CYAN}$COMMIT_PREFIX${RESET_COLOR}\r\n"
  echo "$COMMIT_PREFIX $COMMIT_MESSAGE" > "$1";
fi
