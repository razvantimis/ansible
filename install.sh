#!/usr/bin/env bash

# Install homebrew
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

# Install ansible
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user

python3 -m pip install --user ansible
