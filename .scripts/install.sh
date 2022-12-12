#!/bin/bash

# ====== 0: SETUP XCODE ======
echo "Checking Command Line Tools for Xcode"
# Only run if the tools are not installed yet
# To check that try to print the SDK path
xcode-select -p &> /dev/null
if [ $? -ne 0 ]; then
  echo "Command Line Tools for Xcode not found. Installing from softwareupdate…"
# This temporary file prompts the 'softwareupdate' utility to list the Command Line Tools
  touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
  PROD=$(softwareupdate -l | grep "\*.*Command Line" | tail -n 1 | sed 's/^[^C]* //')
  softwareupdate -i "$PROD" --verbose;
else
  echo "Command Line Tools for Xcode have been installed."
fi


# ====== 1: SETUP DOTFILES FOLDER ======
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


# ====== 2: INSTALL PACKAGE MANAGERS + APPS ======
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"                                        # brew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended && source ~/.zshrc     # oh-my-zsh

# Brew packages to install:
brew install openssl readline sqlite3 xz zlib git gcc jq python pyenv node nvm

# Set compiler and install Python 3.6 for MacPrefs
export CC=clang; pyenv install 3.6

# Install MacPrefs and set backup folder permissions. 
# https://github.com/clintmod/macprefs#config
PREF_FOLDER="$HOME/.macprefs"
brew install clintmod/formulas/macprefs
chmod +a "group:admin allow list,search,readattr,readextattr,readsecurity" $PREF_FOLDER
chmod -R +a "group:admin allow list,search,readattr,readextattr,readsecurity" $PREF_FOLDER
chmod -R +X $PREF_FOLDER
chmod -R o=-x $PREF_FOLDER
cd ~/.macprefs 
macprefs restore
