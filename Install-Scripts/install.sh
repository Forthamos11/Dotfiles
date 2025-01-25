#!/bin/sh

# Handle the User Installations
sudo apt install zsh eza thefuck batcat
curl -fsSL https://bun.sh/install | bash
chmod +x ./Install-Scripts/install-oh-my-zsh.sh
/bin/bash ./Install-Scripts/install-oh-my-zsh.sh

# Start Configuring the Stuff!
chmod +x ./Install-Scripts/mvdata.sh
/bin/bash ./Install-Scripts/mvdata.sh

cat $HOME/.zshrc | grep "alias"