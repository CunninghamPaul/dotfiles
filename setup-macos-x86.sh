#!/bin/bash

#MacOS x86 version

#Backup any existing dotfiles
for i in ~/.zshrc ~/.nanorc ~/.tmux.conf
do
    if test -f $i; then
        mv $i $i.dfbak
        echo $i
    fi
done

#Create Symbolic Links
ln -s ~/dotfiles/.zshrc-macos-x86 ~/.zshrc
ln -s ~/dotfiles/.nanorc-macos-x86 ~/.nanorc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

