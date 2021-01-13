# === === === === === === === === === === === === === === === === ===
# @droxey's Custom ZSH Config
# === === === === === === === === === === === === === === === === ===
ZSH_THEME="oxide"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

#  -> Enabled Plugins:
plugins=(git dotenv osx)

#  -> Launch oh-my-zsh:
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
# ========= 🔼 ZSH CONF 🔼 =========

# ========= 🔽 ENV CONF 🔽 =========
#  -> Locale Settings:
export LANG=en_US.UTF-8

#  -> Editor Settings:
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nano'
else
   export EDITOR='code'
fi
# ========= 🔼 ENV CONF 🔼 =========

# ========= 🔽 KEYBINDINGS 🔽 =========
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
# ========= 🔼 KEYBINDINGS 🔼 =========

# ========= 🔽 ALIASES 🔽 =========
function gi() { curl -sLw n https://www.gitignore.io/api/$@; }
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias githubstars='curl https://gist.githubusercontent.com/yyx990803/7745157/raw/dbcf4874d55490f3c2af9d593950964fe48b1e31/starcounter.js -sSL | node - droxey -t 1'
alias mountusb='sudo ext4fuse /dev/disk2s1 ~/tmp/usb -o allow_other'
# ========= 🔼 ALIASES 🔼 =========

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true
export PATH="$PATH:/Users/dani/.scripts"
export PATH="$PATH:/var/root/Library/Python/3.8/bin"
export PATH="$PATH:/Users/dani/.local/bin"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
