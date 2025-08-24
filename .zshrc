# --- Prompt Setup with colors + vcs_info ---

autoload -U compinit
autoload -Uz vcs_info
autoload colors

compinit
colors

# Configure vcs_info to show git branch
zstyle ':vcs_info:git:*' formats "%F{green}(%b)%f"
precmd() { vcs_info }

# Prompt: [directory] (git-branch) $
setopt PROMPT_SUBST
PROMPT='%F{blue}%~%f ${vcs_info_msg_0_} %# '


# --- Zsh history configuration ---

HISTFILE=~/.zsh_history      # Where history is saved
HISTSIZE=10000               # Number of commands kept in memory
SAVEHIST=10000               # Number of commands saved to $HISTFILE

setopt HIST_IGNORE_DUPS       # Don't record the same command twice in a row
setopt HIST_IGNORE_ALL_DUPS   # Keep only the most recent copy of a command
setopt HIST_SAVE_NO_DUPS      # Don't write duplicate commands to the history file
setopt HIST_EXPIRE_DUPS_FIRST # When trimming history, drop older duplicates first

setopt HIST_REDUCE_BLANKS     # Strip extra spaces before saving
setopt HIST_FIND_NO_DUPS      # Skip duplicates when searching with Ctrl+R
setopt HIST_VERIFY            # Show command from history before running (! expansion)

setopt APPEND_HISTORY         # Append to history file instead of overwriting
setopt INC_APPEND_HISTORY     # Write commands to history immediately
setopt SHARE_HISTORY          # Share history across all open zsh sessions

setopt EXTENDED_HISTORY       # Record timestamp + runtime for each command


alias ls="ls -lsat"

# Functions
function title {
  echo -ne "\033]0;"$*"\007"
}
