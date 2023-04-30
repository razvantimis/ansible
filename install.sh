#!/usr/bin/env bash

# Check for Homebrew and install it 
if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user
rm get-pip.py

# Install ansible

python3 -m pip install --user ansible

# Create a new zsh terminal
exec zsh -l


