#!/usr/bin/env zsh

# This script is used to stow files in the home directory.
STOW_FOLDERS="tmux,zsh,ghostty,aerospace"
DOTFILES="$(cd "${1:-$(dirname "$0")}" && pwd -P)"

# Clear whatever is in the way of stow at each target path, shallowest first so
# a stale folded-directory link is removed before anything underneath it is
# looked at (a file reached through such a link belongs to another checkout).
# Anything that already resolves into this dotfiles dir is ours and stays.
remove_conflicts() {
    local folder=$1
    cd $DOTFILES
    for rel in $(find $folder | sed "s|^$folder/||" | grep -v "^$folder$" | sort); do
        local target="$HOME/$rel"
        [[ -e "$target" || -L "$target" ]] || continue
        [[ "$(realpath "$target" 2>/dev/null)" == "$DOTFILES"/* ]] && continue
        if [[ -L "$target" ]]; then
            echo "Removing stale symlink: $target"
            rm -f "$target"
        elif [[ -f "$target" ]]; then
            echo "Removing conflicting file: $target"
            rm -f "$target"
        fi
    done
}

cd $DOTFILES

for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    echo "stow $folder"
    stow -D -t $HOME $folder 2>/dev/null
    remove_conflicts $folder
    stow -t $HOME $folder
done
