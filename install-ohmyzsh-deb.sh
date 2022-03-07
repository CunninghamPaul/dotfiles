#!/bin/bash

#Install Oh My ZSH and plugins for Debian/Ubuntu

sudo apt update
sudo apt install zsh zsh-autosuggestions zsh-syntax-highlighting -y

#Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

