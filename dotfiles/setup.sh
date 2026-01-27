#!/usr/bin/env zsh

# This script is used to stow files in the home directory.
STOW_FOLDERS="tmux,zsh,alacritty,aerospace"
DOTFILES="${1:-$(cd "$(dirname "$0")" && pwd)}"

# Remove conflicting files/directories before stowing
remove_conflicts() {
    local folder=$1
    cd $DOTFILES

    # Remove conflicting files and stale symlinks
    for file in $(find $folder -type f | sed "s|^$folder/||"); do
        local target="$HOME/$file"
        if [[ -L "$target" ]]; then
            # Remove symlinks that don't point to our dotfiles location
            local link_target=$(readlink "$target")
            if [[ "$link_target" != *"$DOTFILES"* ]]; then
                echo "Removing stale symlink: $target"
                rm -f "$target"
            fi
        elif [[ -e "$target" ]]; then
            echo "Removing conflicting file: $target"
            rm -f "$target"
        fi
    done

    # Remove conflicting directories (stow needs to create symlinks to these)
    # Check directories from deepest to shallowest
    for dir in $(find $folder -type d | sed "s|^$folder/||" | grep -v '^$' | awk '{print length, $0}' | sort -rn | cut -d' ' -f2-); do
        local target="$HOME/$dir"
        if [[ -L "$target" ]]; then
            # Remove symlinks that don't point to our dotfiles location
            local link_target=$(readlink "$target")
            if [[ "$link_target" != *"$DOTFILES"* ]]; then
                echo "Removing stale symlink: $target"
                rm -f "$target"
            fi
        elif [[ -d "$target" ]]; then
            # Only remove if empty (files already removed above)
            if [[ -z "$(ls -A "$target" 2>/dev/null)" ]]; then
                echo "Removing conflicting directory: $target"
                rmdir "$target"
            fi
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
