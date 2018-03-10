#!/bin/bash

# Check XCode
if [[ "$(xcode-select -p)" == "/Applications/Xcode.app/Contents/Developer" ]]; then
    # Use CLI from XCode.app
    sudo xcodebuild -license accept
elif [[ "$(xcode-select -p)" != "/Library/Developer/CommandLineTools" ]]; then
    # Use CLI from system
    sudo xcode-select --install
fi

# Check homebrew
if [ -z "$(command -v brew)" ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Check ansible
if [ -z "$(command -v ansible)" ]; then
    brew install ansible
fi

# Fix High Sierra bug with python fork() errors
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Run Ansible Playbook
ansible-playbook -i hosts.yml setup.yml --ask-pass