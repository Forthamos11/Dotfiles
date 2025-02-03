#!/bin/sh

# Set variables for non-interactive installation
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
ZSH="${ZSH:-$HOME/.oh-my-zsh}"

# Check if zsh is installed
# Unsure if I want to leave this check in here as we install ZSH on its own but I guess if my Script failes, It'd be good to have?
if ! command -v zsh &> /dev/null; then
  echo "zsh is not installed. Please install zsh first (e.g., sudo apt-get install zsh)."
  exit 1
fi

# Check if oh-my-zsh is already installed
if [[ -d "$ZSH" ]]; then
  echo "Oh My Zsh is already installed. Skipping installation."
  exit 0
fi

# Install oh-my-zsh non-interactively. This handles only Curl as we install it in with the "install-packages.sh" file
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo "Oh My Zsh installation complete."