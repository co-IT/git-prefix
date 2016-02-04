#!/bin/sh

function workOnIssue() {
  PREFIX=$1;

  BOLD_WHITE="\e[1;37m"
  RESET_COLOR="\033[0m"

  BRANCH_TO_PREFIX="^feature\/"
  CURRENT_BRANCH=`git rev-parse --abbrev-ref HEAD`

  if [ -n "$PREFIX" ]; then

    if [[ $CURRENT_BRANCH =~ $BRANCH_TO_PREFIX ]] then
      export GIT_COMMIT_PREFIX="$PREFIX"
    fi
    printf "\r\n${BOLD_WHITE}Prefixing enabled${RESET_COLOR}\r\n";
    printf "Make sure enabling the prepare-commit-msg hook\r\n"
    printf "in your repsitory: http://git.io/vITez\r\n\r\n"
  else
    # If no prefix is passed the prefix will be
    # removed from the global .gitconfig.
    unset GIT_COMMIT_PREFIX
    printf "\r\n${BOLD_WHITE}Prefixing disabled${RESET_COLOR}\r\n\r\n";
  fi
}
