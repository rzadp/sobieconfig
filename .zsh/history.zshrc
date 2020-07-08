# https://www.soberkoder.com/better-zsh-history/

export HISTFILESIZE=10000000000
export HISTSIZE=10000000000
export SAVEHIST=10000000000
export HISTFILE=~/.zsh_history

export HISTTIMEFORMAT="[%F %T] "
setopt EXTENDED_HISTORY

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

setopt share_history
setopt hist_verify
