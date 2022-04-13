#!/usr/bin/env bash

echo "You will be prompted for your sudo password in the form of a BECOME prompt."

# Install brew if not present
brew -v
if [[ "$?" -ne "0" ]]; then
	bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/sdake/.profile
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi


# Install ansible if not present
ansible --version
if [[ "$?" -ne "0" ]]; then
	# Install Ansible
	brew install ansible
	# Install brew module, posix module
	ansible-galaxy collection install community.general
	ansible-galaxy collection install ansible.posix
fi

ansible-playbook --ask-become-pass --inventory "localhost," --connection local playbook.yml
