#!/bin/bash
set -e

if test -f /etc/lsb-release; then
  sudo apt-get update
  sudo apt-get install ansible
else 
	if ! which brew 2>&1 >/dev/null; then
		echo "~~> Installing Homebrew..."
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/muller/.profile
		eval "$(/opt/homebrew/bin/brew shellenv)"
	fi

	if ! which ansible 2>&1 >/dev/null; then
		echo "~~> Installing Ansible..."
		brew install ansible ansible-lint
		ansible --version
	fi
fi


if which ansible-playbook 2>&1 >/dev/null; then
	echo "~~> Running Ansible..."
	ansible-playbook ansible/main.yaml 
fi
