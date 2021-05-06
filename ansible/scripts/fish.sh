#!/bin/bash

curl -sL git.io/fisher | source && fisher install jorgebucaran/fisher

# Configuring plugins:
fisher install rafaelrinaldi/pure
fisher install jethrokuan/fzf
fisher install jethrokuan/z
fisher install rstacruz/fish-asdf
evanlucas/fish-kubectl-completions

# Set fish as defaults
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
