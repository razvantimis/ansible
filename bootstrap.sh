#!/usr/bin/env bash

# Install xcode
# xcode-select --install
# sudo xcodebuild -license

# Check for Homebrew and install it 
if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install pip
if test ! $(which brew); then
  curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
  python3 get-pip.py --user
  rm get-pip.py
fi
# Install ansible
if test ! $(which brew); then
python3 -m pip install --user ansible
fi
# Run ansible playbook
ansible-playbook local.yml --ask-become-pass



