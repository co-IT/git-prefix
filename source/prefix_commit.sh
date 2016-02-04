#!/bin/sh

function prefix_commit {
  local checkout_arguments=$@
  local c_end c_green cb_green cb_red

  function __run {
    __init_colors
    __git_checkout
    __set_prefix
  }

  function __init_colors {
    c_end="$(git config --get-color "" "reset")"
    c_green="$(git config --get-color "" "green")"
    cb_green="$(git config --get-color "" "bold green")"
    cb_white="$(git config --get-color "" "bold white")"
    cb_red="$(git config --get-color "" "bold red")"
  }

  function __git_checkout {
    local result=`git checkout $checkout_arguments`
  }

  function __set_prefix {
    local branch_to_prefix="^feature\/(.+)"
    local current_branch=`git rev-parse --abbrev-ref HEAD`
    local prefix=""

    if [[ $current_branch =~ $branch_to_prefix ]]; then
      [[ -n $BASH_VERSION ]] && prefix=( "${BASH_REMATCH[1]}" )
      [[ -n $ZSH_VERSION ]]  && prefix=( "${match[@]}" )

      export GIT_COMMIT_PREFIX=$prefix

      printf "\r\n${c_green}Commit prefix is set to ${cb_green}${prefix}${c_end}\r\n";
      printf "Make sure enabling the prepare-commit-msg hook\r\n"
      printf "in your repsitory: ${cb_white}https://git.io/vgZnb${eb_end}\r\n\r\n"
    else
      unset GIT_COMMIT_PREFIX

      printf "\r\n${cb_red}Commit prefix has been unset${c_end}\r\n\r\n";
    fi
  }

  __run
  return $?
}
