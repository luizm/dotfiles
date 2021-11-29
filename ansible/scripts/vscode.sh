#!/bin/bash

extensions="
    dhoeric.ansible-vault \
    erd0s.terraform-autocomplete \
    esbenp.prettier-vscode \
    hashicorp.terraform
    hnw.vscode-auto-open-markdown-preview \
    jpogran.puppet-vscode \
    mauve.terraform \
    mjmcloug.vscode-elixir \
    ms-kubernetes-tools.vscode-kubernetes-tools \
    ms-python.python \
    ms-vscode.go \
    peterjausovec.vscode-docker \
    rupisaini.vscode-ansible-linter \
    ryu1kn.partial-diff \
    timonwong.shellcheck \
    tyriar.sort-lines \
"

for extension in $extensions; do
	code --install-extension "$extension"
done
