#!/bin/bash

# Install XCode
if [[ "$(xcode-select -p)" != "/Library/Developer/CommandLineTools" ]]; then
     xcode-select --install
    exit 1
fi

# Install Homebrew
if [ -z "$(command -v ansible)" ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install Ansible via Homebrew
brew install ansible

# Run Ansible Playbook
ansible-playbook -i hosts.yml setup.yml --ask-become-pass