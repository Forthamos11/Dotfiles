#!/bin/sh

# Set variables for non-interactive installation
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
ZSH="${ZSH:-$HOME/.oh-my-zsh}"

# Check if zsh is installed
if ! command -v zsh &> /dev/null; then
  echo "zsh is not installed. Please install zsh first (e.g., sudo apt-get install zsh)."
  exit 1
fi

# Check if oh-my-zsh is already installed
if [[ -d "$ZSH" ]]; then
  echo "Oh My Zsh is already installed. Skipping installation."
  exit 0
fi

# Install oh-my-zsh non-interactively. This handles both curl and wget scenarios.
if command -v curl &> /dev/null; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
elif command -v wget &> /dev/null; then
  sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" "" --unattended
else
  echo "Neither curl nor wget are installed. Please install one of them."
  exit 1
fi


# Set zsh as the default shell for the current user *only if it's not already*
if [[ "$SHELL" != "$(which zsh)" ]]; then
  chsh -s $(which zsh)
  echo "Set zsh as the default shell. You may need to open a new terminal or source ~/.zshrc for changes to take effect."
else
    echo "zsh is already the default shell."
fi

# Copy a default .zshrc if one doesn't exist. This prevents errors if plugins try to modify it.
if [[ ! -f "$HOME/.zshrc" ]]; then
  cp "$ZSH/templates/zshrc.zsh-template" "$HOME/.zshrc"
  echo "Created a default .zshrc file."
fi

echo "Oh My Zsh installation complete."