#!/bin/bash

log_file=/install_progress_log.txt

sudo apt-get -y install batcat
if type -p batcat > /dev/null; then
    echo "bat Installed" >> $log_file
else
    echo "bat FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install exa
if type -p exa > /dev/null; then
    echo "exa Installed" >> $log_file
else
    echo "exa FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install thefuck
if type -p thefuck > /dev/null; then
    echo "thefuck Installed" >> $log_file
else
    echo "thefuck FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install zsh
if type -p zsh > /dev/null; then
    echo "zsh Installed" >> $log_file
else
    echo "zsh FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install curl
if type -p curl > /dev/null; then
    echo "curl Installed" >> $log_file
else
    echo "curl FAILED TO INSTALL!!!" >> $log_file
fi

curl -fsSL https://bun.sh/install | bash
echo "bun installed" >> $log_file

# node it seems is installed as nodejs in Mint if that
# is the case we create a symlink to node
if [[ (! -f /usr/bin/node) && (-f /usr/bin/nodejs) ]]; then
    sudo ln -s /usr/bin/nodejs /usr/bin/node
fi

if type -p node > /dev/null; then
    echo -n "Node version: "; echo -n `node --version`; echo " Installed" >> $log_file
else
    echo "node FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install npm
if type -p npm > /dev/null; then
    echo "npm Installed" >> $log_file
else
    echo "npm FAILED TO INSTALL!!!" >> $log_file
fi

curl http://beyondgrep.com/ack-2.08-single-file > ~/ack && chmod 0755 !#:3
sudo mv ~/ack /usr/bin/ack
sudo chmod 755 /usr/bin/ack
if type -p ack > /dev/null; then
    echo "Ack Downloaded and Installed" >> $log_file
else
    echo "Ack FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install python-pip
if type -p pip > /dev/null; then
    echo "pip Installed" >> $log_file
else
    echo "pip FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install bpython
if type -p bpython > /dev/null; then
    echo "bpython Installed" >> $log_file
else
    echo "bpython FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install bpython3
if type -p bpython3 > /dev/null; then
    echo "bpython3 Installed" >> $log_file
else
    echo "bpython3 FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install tmux
if type -p tmux > /dev/null; then
    echo "tmux Installed" >> $log_file
else
    echo "tmux FAILED TO INSTALL!!!" >> $log_file
fi

sudo apt-get -y install colorize
if type -p colorize > /dev/null; then
    echo "colorize Installed" >> $log_file
else
    echo "colorize FAILED TO INSTALL!!!" >> $log_file
fi

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
if type -p brew > /dev/null; then
    echo "homebrew installed" >> $log_file
else
    echo "homebrew FAILED TO INSTALL!!!" >> $log_file
fi

#==============
# Give the user a summary of what has been installed
#==============
echo -e "\n====== Summary ======\n"
cat $log_file
echo
echo "Enjoy -Jay"
rm $log_file