#!/bin/bash

extensions="
    erd0s.terraform-autocomplete \
    esbenp.prettier-vscode \
    hnw.vscode-auto-open-markdown-preview \
    jpogran.puppet-vscode \
    mauve.terraform \
    ms-kubernetes-tools.vscode-kubernetes-tools \
    ms-python.python \
    ms-vscode.go \
    peterjausovec.vscode-docker \
    ryu1kn.partial-diff \
    timonwong.shellcheck \
    tyriar.sort-lines \
    vscoss.vscode-ansible
"

for extension in $extensions; do
	code --install-extension "$extension"
done
