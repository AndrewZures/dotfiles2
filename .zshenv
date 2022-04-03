autoload -U compinit
autoload colors
autoload -Uz vcs_info

compinit
colors

# Env Vars
export EDITOR=vim
export CLICOLOR=1

# Options
setopt nonomatch # allow us to do bracket-based commands without ugliness
setopt EXTENDED_HISTORY # add timestamps to history
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt PROMPT_SUBST
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF
setopt AUTO_CD
setopt HIST_IGNORE_DUPS
setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # dont record dupes in history
setopt HIST_REDUCE_BLANKS

export HISTCONTROL=erasedups  # Ignore duplicate entries in history
export HISTFILE=~/.histfile
export HISTSIZE=10000         # Increases size of history
export SAVEHIST=10000
export HISTIGNORE="&:ls:ll:la:l.:pwd:exit:clear:clr:[bf]g"

#Completion
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # case insensitive completion
zstyle ':completion:*:default' menu 'select=0' # menu-style

# Functions
function title {
  echo -ne "\033]0;"$*"\007"
}

plugins=(zsh_reload)

if [ -z "$_zsh_custom_scripts_loaded" ]; then
  _zsh_custom_scripts_loaded=1
  plugins+=(zsh-autosuggestions zsh-syntax-highlighting)
fi

zstyle ':vcs_info:*' actionformats \
    '%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
precmd () { vcs_info }
PS1='%F{3}%3~ ${vcs_info_msg_0_}%f%# '

# Aliases
alias vim="mvim -v"
alias ls="ls -lh"

# git helper aliases
alias gfci="git log --name-only --oneline -1 | tail +2 | xargs"
alias gfdi="git diff --name-only | xargs"
alias gfds="git diff --staged --name-only | xargs"

# Bindings
bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M viins '^F' history-incremental-pattern-search-forward
bindkey -M viins '^P' up-history
bindkey -M viins '^N' down-history

modified-kill-word() {
  zle kill-word
  zle delete-char
}
zle -N modified-kill-word

export SBT_OPTS="-XX:MaxPermSize=1G"
export LSCOLORS=''
