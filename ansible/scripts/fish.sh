#!/bin/bash

curl -sL git.io/fisher | source && fisher install jorgebucaran/fisher

# Configuring plugins:
fisher add rstacruz/fish-asdf

# Set fish as default
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
