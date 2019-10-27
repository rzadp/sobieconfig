export LC_CTYPE=en_US.UTF-8

if [[ $(hostname) = "przemek-desktop" ]]; then
  export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64:$LD_LIBRARY_PATH
  export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
fi

if [ -z "$TMUX" ] && [ -n "$SSH_TTY" ] && [[ $- =~ i ]]; then
    tmux new-session -A -s sobietmux
    exit
fi


export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME=""
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#c6c6c6"

ZLE_SPACE_SUFFIX_CHARS=$'|&' # https://unix.stackexchange.com/questions/174630/keep-the-space-after-completion-for-some-characters-in-zsh

plugins=(git fzf docker-compose virtualenv bgnotify zsh-syntax-highlighting zsh-autosuggestions github)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh
#
export PATH="/opt/bin:$PATH:/snap/bin:$HOME/Library/Python/3.7/bin:$HOME/.local/bin:$HOME/.local/lib/python3.5/site-packages:/Library/TeX/texbin:/usr/local/bin:/usr/local/opt/rabbitmq/sbin:$HOME/bin:/usr/local/bin:/sbin:/usr/sbin:$HOME/.zsh/pure"
export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk-12.0.1.jdk/Contents/Home/'
export PLANTUML_JAR="$HOME/bin/plantuml/plantuml.jar"
export GRAPHVIZ_DOT='/usr/local/bin/dot'

alias zshrc="code -nw ~/.zshrc && source ~/.zshrc"
alias docker_clear='docker kill $(docker ps -q); docker rm $(docker ps -a -q)'

nvm_load() {
  local NVM_OPTION=""
  export NVM_DIR="$HOME/.nvm"
  [[ -n $SSH_CONNECTION ]] && NVM_OPTION="--no-use" 
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" "$NVM_OPTION"  # This loads nvm
}
nvm_load

autoload -U promptinit; promptinit
prompt pure

export RPROMPT=''
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
local virtualenv=$(virtualenv_prompt_info)
export PROMPT='%D{%H:%M} $(virtualenv_prompt_info)${ret_status}%{$reset_color%}'

eval $(thefuck --alias)
alias f="fuck"
alias fy="fuck --yeah"
alias yb="yarn build"

function tb() {
  cd ~/Projects/badminton-monorepo/badminton/training/logs
  [ ! -z $1 ] && tensorboard --logdir "$1" || ls
}

ul() {
  cd ~/Projects/UniversalLoginSDK
  local prefix="universal-login-"
  [ -z $1 ] && { ls | grep $prefix | sed -e "s/^$prefix//" } || cd $prefix$1
}

function _ul() {
  local prefix="universal-login-"
  compadd $(ls ~/Projects/UniversalLoginSDK | grep $prefix | sed -e "s/^$prefix//")
}
compdef _ul ul

function topup() {
  command -v universal-login || { ul; yarn link; }
  universal-login send $1 1
}

alias ci='hub ci-status -v'
alias pr='hub pr list -f "  %pC#: %I%Creset (by: %au) (reviewing: %rs)  %t%  l%n"'


alias sobieconfig='/usr/bin/git --git-dir=$HOME/sobieconfig/ --work-tree=$HOME'
sobieconfig config --local status.showUntrackedFiles no
sobieconfig pull --recurse-submodules --quiet
alias sobieconfig_push='sobieconfig add -u && sobieconfig commit -m "sobieconfig" && sobieconfig push'
