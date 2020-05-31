export ZSH="$HOME/.oh-my-zsh"

plugins=(git fzf docker-compose virtualenv bgnotify zsh-syntax-highlighting zsh-autosuggestions github)
ZSH_THEME=""
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#c6c6c6"
ZLE_SPACE_SUFFIX_CHARS=$'|&' # https://unix.stackexchange.com/questions/174630/keep-the-space-after-completion-for-some-characters-in-zsh
source $ZSH/oh-my-zsh.sh

autoload -U promptinit; promptinit
( prompt -l | grep -q pure ) && prompt pure || echo "Consider installing 'pure' prompt"

export RPROMPT=''
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
local virtualenv=$(virtualenv_prompt_info)
export PROMPT='%D{%H:%M} $(virtualenv_prompt_info)${ret_status}%{$reset_color%}'
