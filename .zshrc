# === === === === === === === === === === === === === === === === ===
# @droxey's Custom ZSH Config
# === === === === === === === === === === === === === === === === ===
ZSH_THEME="powerlevel10k/powerlevel10k"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(bgnotify catimg command-not-found git git-extras pip virtualenv)

#  -> Powerlevel 10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
 source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#  -> Launch oh-my-zsh:
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

#  -> Locale Settings:
export LANG=en_US.UTF-8

#  -> Editor Settings:
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nano'
else
   export EDITOR='code'
fi

#  -> Ruby
if which rbenv >/dev/null; then eval "$(rbenv init -)"; fi

# -> iTerm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# -> Aliases
function gi() { curl -sLw n https://www.gitignore.io/api/$@; }
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias githubstars='curl https://gist.githubusercontent.com/yyx990803/7745157/raw/dbcf4874d55490f3c2af9d593950964fe48b1e31/starcounter.js -sSL | node - droxey -t 1'
alias mountusb='sudo ext4fuse /dev/disk2s1 ~/tmp/usb -o allow_other'
alias mongod="mongo --port 27017 --dbpath /opt/homebrew/var/mongodb"
# alias python=/opt/homebrew/bin/python3
# alias python3=/opt/homebrew/bin/python3

# -> Path Modification
if [ -f '/Users/droxey/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/droxey/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/droxey/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/droxey/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="$PATH:$HOME/.scripts"
export PATH="$PATH:$HOME/.dotfiles"
export PATH="$PATH:/opt/homebrew/bin/"
export PATH="$PATH:/opt/homebrew/opt/python@3.10/libexec/bin"
export PATH="$PATH:/opt/homebrew/lib/python3.10/site-packages"
export PATH="/opt/homebrew/opt/node@19/bin:$PATH"
export PATH="$PATH:$HOME/.local/bin"
export PATH="/usr/local/sbin:$PATH"

# Pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
# -> Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# -> Dotfiles and Preferences
[ ! -d "$HOME/.dotfiles" ] && echo "$HOME/.dotfiles does not exist. Are they installed?: https://github.com/droxey/dotfiles"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
