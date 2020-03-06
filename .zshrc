alias sobieconfig='/usr/bin/git --git-dir=$HOME/sobieconfig/ --work-tree=$HOME'
sobieconfig config --local status.showUntrackedFiles no
alias sobieconfig_push='sobieconfig add -u && sobieconfig commit -m "sobieconfig" && sobieconfig push'

alias sc='shellcheck'

if [ -z "$TMUX" ] && [ -n "$SSH_TTY" ] && [[ $- =~ i ]]; then
  tmux new-session -A -s sobietmux
  exit # Exit because all the following stuff will be loaded when creating the new tmux session
fi

if [[ -n $SSH_CONNECTION ]]; then
  alias zshrc="nano ~/.zshrc && source ~/.zshrc"
else
  alias zshrc="code -nw ~/.zshrc && source ~/.zshrc"
fi

#https://github.com/NixOS/nix/issues/2925#issuecomment-499799055
export NIX_IGNORE_SYMLINK_STORE=1


export PATH="$HOME/.yarn/bin:/opt/bin:$PATH:/snap/bin:$HOME/Library/Python/3.7/bin:$HOME/.local/bin:$HOME/.local/lib/python3.5/site-packages:/Library/TeX/texbin:/usr/local/bin:/usr/local/opt/rabbitmq/sbin:$HOME/bin:/usr/local/bin:/sbin:/usr/sbin:$HOME/.zsh/pure"
export PATH="/opt/bin:$HOME/.gem/ruby/2.6.0/bin:$PATH:/snap/bin:$HOME/Library/Python/3.7/bin:$HOME/.local/bin:$HOME/.local/lib/python3.5/site-packages:/Library/TeX/texbin:/usr/local/bin:/usr/local/opt/rabbitmq/sbin:$HOME/bin:/usr/local/bin:/sbin:/usr/sbin:$HOME/.zsh/pure"

export LC_CTYPE=en_US.UTF-8
export ZSH="$HOME/.oh-my-zsh"

if [[ $(hostname) = "przemek-desktop" ]]; then
  # cuda stuff
  export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64:$LD_LIBRARY_PATH
  export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
fi


plugins=(git fzf docker-compose virtualenv bgnotify zsh-syntax-highlighting zsh-autosuggestions github)
ZSH_THEME=""
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#c6c6c6"
ZLE_SPACE_SUFFIX_CHARS=$'|&' # https://unix.stackexchange.com/questions/174630/keep-the-space-after-completion-for-some-characters-in-zsh
source $ZSH/oh-my-zsh.sh

export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk-12.0.1.jdk/Contents/Home/'
export PLANTUML_JAR="$HOME/bin/plantuml/plantuml.jar"
export GRAPHVIZ_DOT='/usr/local/bin/dot'

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
alias yt="yarn test"
alias ylf="yarn lint --fix"
alias ylfp='yarn lint --fix && git add -u && git commit -m "Lint" && git push'

function tb() {
  cd ~/Projects/badminton-monorepo/badminton/training/logs
  [ ! -z $1 ] && tensorboard --logdir "$1" || ls
}

monorepo_util() { # $1: path, $2: prefix, $3: arg
  cd $1
  [ -z $3 ] || [ ! -d $2$3 ] && { ls | grep $2 | sed -e "s/^$2//" } || cd $2$3
}
monorepo_completion() { # $1: path, $2: prefix
  compadd $(ls $1 | grep $2 | sed -e "s/^$2//")
}
op() {
  monorepo_util ~/Projects/ats-demo-monorepo "oasis-pro-" $1
}
_op() {
  monorepo_completion ~/Projects/ats-demo-monorepo "oasis-pro-"
}
compdef _op op
opdrop() {
  psql -c "drop database oasis_pro_development;"
  psql -c "drop database oasis_pro_testing;"
  psql -c "create database oasis_pro_development;"
  psql -c "create database oasis_pro_testing;"
}

ul() {
  cd ~/Projects/UniversalLoginSDK
  local prefix="universal-login-"
  [ -z $1 ] || [ ! -d $prefix$1 ] && { ls | grep $prefix | sed -e "s/^$prefix//" } || { cd $prefix$1; shift }
  $@ # Invoke passed command if passed
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
alias prune="(git checkout -q origin/master || git checkout -q origin/dev); git fetch -p && git branch -vv | grep ': gone]' | awk '{print \$1}' | xargs git branch -D"

source /Users/przemek/Library/Preferences/org.dystroy.broot/launcher/bash/br
