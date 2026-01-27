#!/usr/bin/env bash
set -e

# Install xcode
# xcode-select --install
# sudo xcodebuild -license

# Check for Homebrew and install it
if ! command -v brew &>/dev/null; then
	echo "Installing homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Add Homebrew to PATH for M1 Macs
if [[ -f /opt/homebrew/bin/brew ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -f /usr/local/bin/brew ]]; then
	eval "$(/usr/local/bin/brew shellenv)"
fi

# Install pip if not available
if ! command -v pip3 &>/dev/null; then
	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	python3 get-pip.py --user
	rm get-pip.py
fi

# Add Python user bin to PATH
PYTHON_USER_BIN=$(python3 -m site --user-base)/bin
export PATH="$PYTHON_USER_BIN:$PATH"

# Install ansible
if ! command -v ansible &>/dev/null; then
	echo "Installing ansible..."
	python3 -m pip install --user ansible
fi

# Run ansible playbook
ansible-playbook local.yml --ask-become-pass --ask-vault-pass
