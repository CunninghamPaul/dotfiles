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

# Configure automatic dotfiles updates
DOTFILES_USER="paulcunningham"
DOTFILES_HOME="/home/$DOTFILES_USER"
DOTFILES_DIR="$DOTFILES_HOME/dotfiles"

CRON_JOB="0 3 * * * /usr/bin/flock -n $DOTFILES_HOME/.dotfiles-update.lock $DOTFILES_DIR/update-dotfiles.sh >> $DOTFILES_HOME/dotfiles-update.log 2>&1"

(
    crontab -u "$DOTFILES_USER" -l 2>/dev/null |
        grep -Fv "update-dotfiles.sh" || true
    echo "$CRON_JOB"
) | crontab -u "$DOTFILES_USER" -

echo "Daily dotfiles updates configured for $DOTFILES_USER"

#cant run source .zshrc as this is running under bash
#remind to run source
echo "Setup complete."
echo "Run 'exec zsh' to reload your shell configuration."

