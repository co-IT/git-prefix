# git-prefix

![demo](demo.gif)

## Commits via convention
`git_prefix` enhances `git checkout`. When a branch has changed `git_prefix` will check if it matches the pattern `feature/<any>`. `#<any>` is taken as prefix for all commits that will be created on that branch.
The additional `#` is necessary for several issue-trackers to get notice that a commit was pushed which relates to an issue.

*Note* that the automatic prefix is configured for branches that start with `feature/`.

The prefix is saved in the environment variable `GIT_COMMIT_PREFIX`. It will be read by the `prepare-commit-msg` hook to set the prefix in front of each commit message.

| Usage                    | Explanation                                |
|--------------------------|--------------------------------------------|
| `git_prefix <branch>`    | Use prefix in a existing branch            |
| `git_prefix -b <branch>` | Creates a new branch an enables prefixing  |
