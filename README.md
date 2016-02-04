# git-prefix-commit-message

## Create the following alias

```
alias co='f() { git checkout "$@"; workOnIssue }; f'
```


## How it workOnIssue

Saving a commit message prefix in environment variable `GIT_COMMIT_PREFIX` .It will be read by the hook to set the prefix in front of the commit message.

If no prefix is passed the environment variable `GIT_COMMIT_PREFIX` will be removed from the global .gitconfig.
