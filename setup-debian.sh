#!/bin/bash

#Setup dotfiles for Debian based Linux
#Requires oh-my-zsh and plugins see install-ohmyzsh-deb.sh

#Backup any existing dotfiles
for i in ~/.zshrc ~/.nanorc ~/.tmux.conf
do
    if test -f $i; then
        mv $i $i.dfbak
    fi
done

#Create Symbolic Links
ln -s ~/dotfiles/.zshrc-deb ~/.zshrc
ln -s ~/dotfiles/.nanorc-deb ~/.nanorc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

#Get current username
username="$(whoami)"
#Link nano prefs in root profile for sudo nano use
sudo ln -sf /home/$username/dotfiles/.nanorc-deb /root/.nanorc

#run source .zshrc
source ~/.zshrc

