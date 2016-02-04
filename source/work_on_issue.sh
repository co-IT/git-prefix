#!/bin/sh

function workOnIssue() {
  BOLD_RED="$(git config --get-color "" "bold red")"
  GREEN="$(git config --get-color "" "green")"
  BOLD_GREEN="$(git config --get-color "" "bold green")"
  RESET_COLOR="$(git config --get-color "" "reset")"

  BRANCH_TO_PREFIX="^feature\/(.+)"
  CURRENT_BRANCH=`git rev-parse --abbrev-ref HEAD`

  typeset match
  unset -v prefix # initialize output variable

  if [[ $CURRENT_BRANCH =~ $BRANCH_TO_PREFIX ]] then

    [[ -n $BASH_VERSION ]] && prefix=( "${BASH_REMATCH[@]}" )
    [[ -n $KSH_VERSION ]]  && prefix=( "${.sh.match[@]}" )
    [[ -n $ZSH_VERSION ]]  && prefix=( "${match[@]}" )

    export GIT_COMMIT_PREFIX=$prefix

    printf "\r\n${GREEN}Commit prefix is set to ${BOLD_GREEN}${prefix}${RESET_COLOR}\r\n";
    printf "Make sure enabling the prepare-commit-msg hook\r\n"
    printf "in your repsitory: http://git.io/vITez\r\n\r\n"
  else
    unset GIT_COMMIT_PREFIX

    printf "\r\n${BOLD_RED}Commit prefix has been unset${RESET_COLOR}\r\n\r\n";
  fi
}
