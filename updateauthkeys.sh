#!/bin/bash

me="$(whoami)"

read -r -p "Are you sure you want to overwrite authorized_keys for ${me}? y/n " choice

case $choice in
      [yY])
            echo "Updating ~/.ssh/authorized_keys for user ${me}"

            if [ ! -d "~/.ssh" ]; then
                echo "~/.ssh Does not exist. Creating directory"
                mkdir ~/.ssh
                chmod 700 ~/.ssh
            fi

            if [ -d "~/.ssh" ]; then
                cat pubkeys > ~/.ssh/authorized_keys
            else
                echo "Error ~/.ssh directory not found"
            fi
            ;;
      [nN])
            echo 'Exiting'
            exit
            ;;
      *)
            echo 'Invalid input...'
            echo 'Exiting'
            exit
            ;;
esac

