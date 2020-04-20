# === === === === === === === === === === === === === === === === ===
# @droxey's Custom ZSH Config
# === === === === === === === === === === === === === === === === ===
ZSH_THEME="ys"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

#  -> Enabled Plugins:
plugins=(git dotenv osx)

#  -> Launch oh-my-zsh:
export ZSH="/Users/dani/.oh-my-zsh"; source $ZSH/oh-my-zsh.sh
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
function gi() { curl -sLw n https://www.gitignore.io/api/$@ ;}
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
# ========= 🔼 ALIASES 🔼 =========
