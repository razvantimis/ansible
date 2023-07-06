#!/usr/bin/env bash

# Install xcode
# xcode-select --install
# sudo xcodebuild -license

# Check for Homebrew and install it
if ! which brew >/dev/null; then
	echo "Installing homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install pip
if test ! $(which brew); then
	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	python3 get-pip.py --user
	rm get-pip.py
fi
# Install ansible
if ! which ansible >/dev/null; then
	echo "Installing ansible..."
	python3 -m pip install --user ansible
fi
# TODO: Add in path python bin

## export PATH=$PATH:$HOME/Library/Python/3.9/bin
# Run ansible playbook
ansible-playbook local.yml --ask-become-pass --ask-vault-pass
