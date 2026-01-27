#!/usr/bin/env zsh

# This script is used to stow files in the home directory.
STOW_FOLDERS="tmux,zsh,alacritty,aerospace"
DOTFILES=$HOME/.dotfiles

for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    echo "stow $folder"
    stow -D $folder 2>/dev/null
    stow $folder
done
