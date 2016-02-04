#!/bin/sh

function prefix_commit() {
  c_end="$(git config --get-color "" "reset")"
  c_green="$(git config --get-color "" "green")"
  cb_green="$(git config --get-color "" "bold green")"
  cb_red="$(git config --get-color "" "bold red")"

  branch_to_prefix="^feature\/(.+)"
  current_branch=`git rev-parse --abbrev-ref HEAD`

  if [[ $current_branch =~ $branch_to_prefix ]]; then
    [[ -n $BASH_VERSION ]] && prefix=( "${BASH_REMATCH[1]}" )
    [[ -n $ZSH_VERSION ]]  && prefix=( "${match[@]}" )

    export GIT_COMMIT_PREFIX=$prefix

    printf "\r\n${c_green}Commit prefix is set to ${cb_green}${prefix}${c_end}\r\n";
    printf "Make sure enabling the prepare-commit-msg hook\r\n"
    printf "in your repsitory: http://git.io/vITez\r\n\r\n"
  else
    unset GIT_COMMIT_PREFIX

    printf "\r\n${cb_red}Commit prefix has been unset${c_end}\r\n\r\n";
  fi
}
