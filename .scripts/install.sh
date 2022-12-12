#!/bin/bash

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

# Install Brew.
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install MacPrefs.
brew install clintmod/formulas/macprefs

# Prep MacPrefs backup folder for restore.
chmod +a "group:admin allow list,search,readattr,readextattr,readsecurity" .macprefs
chmod -R +a "group:admin allow list,search,readattr,readextattr,readsecurity" .macprefs
chmod -R +X .macprefs
chmod -R o=-x .macprefs

# Restore .plist settings.
macprefs restore
