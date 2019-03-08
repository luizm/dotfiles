#!/bin/bash
set -e

if ! which brew 2>&1 >/dev/null; then
	echo "~~> Installing Homebrew..."
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if ! which ansible 2>&1 >/dev/null; then
	echo "~~> Installing Ansible..."
	brew install ansible
	ansible --version
fi

if which ansible-playbook 2>&1 >/dev/null; then
	echo "~~> Running Ansible..."
	ansible-playbook ansible/main.yaml
fi
