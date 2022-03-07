#!/bin/bash

#Backup any existing dotfiles
for i in ~/.zshrc ~/.nanorc ~/.tmux.conf
do
    if test -f $i; then
        mv $i $i.dfbak
        echo $i
    fi
done

#Create Symbolic Links
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.nanorc ~/.nanorc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

