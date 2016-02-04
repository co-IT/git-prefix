#!/bin/sh

function workOnIssue() {
  PREFIX=$1;

  BOLD_RED="$(git config --get-color "" "bold red")"
  BOLD_GREEN="$(git config --get-color "" "bold green")"
  RESET_COLOR="$(git config --get-color "" "reset")"

  BRANCH_TO_PREFIX="^feature\/"
  CURRENT_BRANCH=`git rev-parse --abbrev-ref HEAD`

  if [ -n "$PREFIX" ]; then

    if [[ $CURRENT_BRANCH =~ $BRANCH_TO_PREFIX ]] then
      export GIT_COMMIT_PREFIX="$PREFIX"
    fi
    printf "\r\n${BOLD_GREEN}Prefixing enabled${RESET_COLOR}\r\n";
    printf "Make sure enabling the prepare-commit-msg hook\r\n"
    printf "in your repsitory: http://git.io/vITez\r\n\r\n"
  else
    unset GIT_COMMIT_PREFIX
    printf "\r\n${BOLD_RED}Prefixing disabled${RESET_COLOR}\r\n\r\n";
  fi
}
