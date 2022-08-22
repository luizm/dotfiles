#!/usr/bin/env fish

curl -sL git.io/fisher | source && fisher install jorgebucaran/fisher
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

# Configuring plugins:
fisher install blackjid/plugin-kubectl
fisher install dracula/fish
fisher install evanlucas/fish-kubectl-completions
fisher install franciscolourenco/done
fisher install gazorby/fish-abbreviation-tips
fisher install jethrokuan/fzf
fisher install jethrokuan/z
fisher install jorgebucaran/nvm.fish
fisher install rafaelrinaldi/pure

# Set fish as defaults
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

