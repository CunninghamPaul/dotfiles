#!/usr/bin/env bash
set -euo pipefail

REPO="$HOME/dotfiles"
LOG_PREFIX="[dotfiles]"

cd "$REPO"

# Don't overwrite locally modified tracked files
if [[ -n "$(git status --porcelain --untracked-files=no)" ]]; then
    echo "$LOG_PREFIX Local changes detected; skipping update"
    exit 1
fi

# Update from GitHub, fast-forward only
git pull --ff-only --quiet origin master

echo "$LOG_PREFIX Updated successfully at $(date)"
