#!/usr/bin/env zsh

# This script is used to stow files in the home directory.
STOW_FOLDERS="tmux,zsh,alacritty,aerospace"
DOTFILES=$HOME/.dotfiles

# Remove conflicting files/directories before stowing
remove_conflicts() {
    local folder=$1
    cd $DOTFILES

    # Remove conflicting files
    for file in $(find $folder -type f | sed "s|^$folder/||"); do
        local target="$HOME/$file"
        if [[ -e "$target" && ! -L "$target" ]]; then
            echo "Removing conflicting file: $target"
            rm -f "$target"
        fi
    done

    # Remove conflicting directories (stow needs to create symlinks to these)
    # Check directories from deepest to shallowest
    for dir in $(find $folder -type d | sed "s|^$folder/||" | grep -v '^$' | awk '{print length, $0}' | sort -rn | cut -d' ' -f2-); do
        local target="$HOME/$dir"
        if [[ -d "$target" && ! -L "$target" ]]; then
            # Only remove if empty (files already removed above)
            if [[ -z "$(ls -A "$target" 2>/dev/null)" ]]; then
                echo "Removing conflicting directory: $target"
                rmdir "$target"
            fi
        fi
    done
}

for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    echo "stow $folder"
    stow -D $folder 2>/dev/null
    remove_conflicts $folder
    stow $folder
done
