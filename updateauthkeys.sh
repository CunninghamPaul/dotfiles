#!/bin/bash

me="$(whoami)"
sshdir="$HOME/.ssh"

read -r -p "Are you sure you want to overwrite authorized_keys for ${me}? y/n " choice

case $choice in
      [yY])
            echo "Updating $sshdir/authorized_keys for user ${me}"

            if [ ! -d $sshdir ]; then
                echo "$sshdir Does not exist. Creating directory"
                mkdir $sshdir
                chmod 700 $sshdir
            fi

            if [ -d $sshdir ]; then
                cat pubkeys > $sshdir/authorized_keys
            else
                echo "Error $sshdir directory not found"
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

