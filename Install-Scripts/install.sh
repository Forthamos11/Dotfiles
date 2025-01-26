#!/bin/sh

#==============
# Handle the User Installations
#==============
sudo apt install eza thefuck
sudo apt-get install zsh
curl -fsSL https://bun.sh/install | bash
chmod +x ./Install-Scripts/install-oh-my-zsh.sh
/bin/bash ./Install-Scripts/install-oh-my-zsh.sh


#==============
# Variables
#==============
dotfiles_dir=~/Dotfiles
log_file=~/install_progress_log.txt

#==============
# Delete existing dot files and folders
#==============
sudo rm -rf ~/.vim > /dev/null 2>&1
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.bashrc > /dev/null 2>&1
sudo rm -rf ~/.tmux > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
sudo rm -rf ~/.zsh_prompt > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1
sudo rm -rf ~/.gitconfig > /dev/null 2>&1
sudo rm -rf ~/.antigen > /dev/null 2>&1
sudo rm -rf ~/.antigen.zsh > /dev/null 2>&1
sudo rm -rf ~/.psqlrc > /dev/null 2>&1
sudo rm -rf ~/.tigrc > /dev/null 2>&1
sudo rm -rf ~/.config > /dev/null 2>&1

#==============
# Create symlinks in the home folder
# Allow overriding with files of matching names in the custom-configs dir
#==============
ln -sf $dotfiles_dir/.config ~/.config
ln -sf $dotfiles_dir/.tmux ~/.tmux
ln -sf $dotfiles_dir/.zshrc ~/.zshrc
ln -sf $dotfiles_dir/.tmux.conf ~/.tmux.conf

#==============
# Set zsh as the default shell
#==============
sudo chsh -s /bin/zsh