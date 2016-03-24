#!/bin/sh

function git_prefix {
  local checkout_arguments
  local exit_code
  local c_end c_green cb_green cb_red

  [[ -n $BASH_VERSION ]] && checkout_arguments=$@
  [[ -n $ZSH_VERSION ]]  && checkout_arguments=($@)

  function git_prefix__run {
    git_prefix__init_colors
    git_prefix__git_checkout
    git_prefix__set_prefix
  }

  function git_prefix__init_colors {
    c_end="$(git config --get-color "" "reset")"
    c_green="$(git config --get-color "" "green")"
    cb_green="$(git config --get-color "" "bold green")"
    cb_white="$(git config --get-color "" "bold white")"
    cb_red="$(git config --get-color "" "bold red")"
  }

  function git_prefix__git_checkout {
    exit_code="$(git checkout $checkout_arguments)"
    exit_code=$?
  }

  function git_prefix__set_prefix {
    local branch_to_prefix="^feature\/(.+)"
    local current_branch="$(git rev-parse --abbrev-ref HEAD)"
    local prefix=""

    if [[ $current_branch =~ $branch_to_prefix ]]; then
      [[ -n $BASH_VERSION ]] && prefix=( "${BASH_REMATCH[1]}" )
      [[ -n $ZSH_VERSION ]]  && prefix=( "${match[@]}" )

      export GIT_COMMIT_PREFIX="$prefix"

      printf "\r\n${c_green}Commit prefix is set to ${cb_green}${prefix}${c_end}\r\n";
      printf "Make sure enabling the prepare-commit-msg hook\r\n"
      printf "in your repsitory: ${cb_white}https://git.io/vgcGK${eb_end}\r\n\r\n"
    else
      unset GIT_COMMIT_PREFIX
    fi
  }

  git_prefix__run
  return $exit_code
}
