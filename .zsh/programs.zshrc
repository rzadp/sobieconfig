#https://github.com/NixOS/nix/issues/2925#issuecomment-499799055
export NIX_IGNORE_SYMLINK_STORE=1

export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk-12.0.1.jdk/Contents/Home/'
export PLANTUML_JAR="$HOME/bin/plantuml/plantuml.jar"
export GRAPHVIZ_DOT='/usr/local/bin/dot'

export LC_CTYPE=en_US.UTF-8 # for some C++ / CUDA stuff

( command -v broot > /dev/null ) && source /Users/przemek/Library/Preferences/org.dystroy.broot/launcher/bash/br || echo "Consider installing broot"
( command -v shellcheck > /dev/null ) && eval $(thefuck --alias) || echo "Consider installing thefuck"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh || echo "Consider installing fzf"
( command -v shellcheck > /dev/null ) || echo "Consider installing shellcheck"

# Might require this hack https://github.com/nvm-sh/nvm/issues/1702#issuecomment-444309875
lazynvm() {
  unset -f nvm node npm npx yarn
  export NVM_DIR=~/.nvm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
}

nvm() {
  lazynvm 
  nvm $@
}
 
node() {
  lazynvm
  node $@
}
 
npm() {
  lazynvm
  npm $@
}

npx() {
  lazynvm
  npx $@
}

yarn() {
  lazynvm
  yarn $@
}

nvm_load() {
  local NVM_OPTION=""
  export NVM_DIR="$HOME/.nvm"
  [[ -n $SSH_CONNECTION ]] && NVM_OPTION="--no-use" 
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" "$NVM_OPTION"  # This loads nvm
}
# nvm_load // disabled in favor of lazy laoding
