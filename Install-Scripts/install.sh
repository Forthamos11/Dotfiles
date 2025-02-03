#!/bin/sh

#==============
# Handle the User Installations
#==============
chmod +x $HOME/dotfiles/Install-Scripts/install-packages.sh
chmod +x $HOME/dotfiles/Install-Scripts/install-oh-my-zsh.sh
/bin/bash $HOME/dotfiles/Install-Scripts/install-packages.sh
/bin/bash $HOME/dotfiles/Install-Scripts/install-oh-my-zsh.sh


#==============
# Variables
#==============
dotfiles_dir=~/dotfiles
log_file=~/install_progress_log.txt

#==============
# Create Backup's of Important files if anything failes
#==============
mkdir -p ~/config-backups
cp ~/.bashrc ~/config-backups/.bashrc.bak
cp ~/.zshrc ~/config-backups/.zshrc.bak

#==============
# Delete existing dot files and folders
#==============
sudo rm -rf ~/.vim > /dev/null 2>&1
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.bashrc > /dev/null 2>&1
sudo rm -rf ~/.tmux > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
sudo rm -rf ~/.gitconfig > /dev/null 2>&1
sudo rm -rf ~/.antigen > /dev/null 2>&1
sudo rm -rf ~/.antigen.zsh > /dev/null 2>&1
sudo rm -rf ~/.psqlrc > /dev/null 2>&1
sudo rm -rf ~/.tigrc > /dev/null 2>&1
sudo rm -rf ~/.config > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1

# copy the zshrc file because symlinks dont work for some reason
cp $dotfiles_dir/.zshrc ~/.zshrc

#==============
# Create symlinks in the home folder
# Allow overriding with files of matching names in the custom-configs dir
#==============
ln -sf $dotfiles_dir/.config/ ~/.config/
ln -sf $dotfiles_dir/.tmux/ ~/.tmux/
ln -sf $dotfiles_dir/.tmux.conf ~/.tmux.conf

#==============
# Create a symlink if user is in a WSL environment to also link the hushlogin file
#==============
if [ -n "$WSL_DISTRO_NAME" ]; then
    ln -sf $dotfiles_dir/.hushlogin ~/.hushlogin
fi

#==============
# Set zsh as the default shell
#==============
sudo chsh -s /bin/zsh

#==============
# Install the two Plugins we're using and the Theme
#==============
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

#==============
# Install the Starship prompt
#==============
brew install starship

#==============
# Let the user know that we're done
#==============
echo "Installation Finished. Have an excellent day"
echo "Here's the Log:"
echo $log_file