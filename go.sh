#!/bin/bash

echo "You will be prompted for your sudo password."

# Install brew if not present
brew -v
if [[ "$?" -ne "0" ]]; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install ansible if not present
ansible --version
if [[ "$?" -ne "0" ]]; then
	# Install Ansible
	brew install ansible
	# Install brew module, posix module
	ansible-galaxy collection install community.general
	ansible-galaxy collection install ansible.posix
	ansible-galaxy install pipersniper.macos_installer
fi

ansible-playbook --ask-become-pass --inventory "localhost," --connection local playbook.yml