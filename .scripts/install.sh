#!/usr/bin/bash

# Clone bare dotfiles repo to home directory.
git clone --bare https://github.com/droxey/dotfiles.git $HOME/.dotfiles

# Create a function to alias git.
function dotfiles {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

# Create a backup of any existing dotfiles.
mkdir -p .dotfiles-backup

# Checkout and configure dotfiles.
dotfiles checkout
if [ $? = 0 ]; then
  echo "Checked out dotfiles.";
  else
    echo "Backing up existing dotfiles.";
    dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
fi;
dotfiles checkout
dotfiles config status.showUntrackedFiles no
