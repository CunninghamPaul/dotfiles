#!/bin/bash

me="$(whoami)"

read -r -p "Are you sure you want to overwrite authorized_keys for ${me}? y/n " choice

case $choice in
      [yY])
            echo "Updating ~/.ssh/authorized_keys for user ${me}"
            cat pubkeys > ~/.ssh/authorized_keys
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

