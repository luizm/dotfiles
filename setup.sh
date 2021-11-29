#!/bin/bash
set -e

if test -f /etc/lsb-release; then
  sudo apt-get update
  sudo apt-get install ansible
else 
	if ! which brew 2>&1 >/dev/null; then
		echo "~~> Installing Homebrew..."
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	fi

	if ! which ansible 2>&1 >/dev/null; then
		echo "~~> Installing Ansible..."
		brew install ansible
		ansible --version
	fi
fi


if which ansible-playbook 2>&1 >/dev/null; then
	echo "~~> Running Ansible..."
	ansible-playbook ansible/main.yaml 
fi
