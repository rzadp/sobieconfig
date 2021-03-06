export PLUGINS_DIR=~/.zsh/plugins

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#c6c6c6"
ZLE_SPACE_SUFFIX_CHARS=$'|&' # https://unix.stackexchange.com/questions/174630/keep-the-space-after-completion-for-some-characters-in-zsh

# ZSH_THEME=""
# source $ZSH/oh-my-zsh.sh

# Load selected libs from ohmyzsh
source $PLUGINS_DIR/ohmyzsh/lib/key-bindings.zsh
source $PLUGINS_DIR/ohmyzsh/lib/completion.zsh

export FZF_BASE=$PLUGINS_DIR/fzf

# Load all of the plugins
plugins=(fzf docker-compose virtualenv bgnotify zsh-syntax-highlighting zsh-autosuggestions)
for plugin ($plugins); do
  if [ -f $PLUGINS_DIR/$plugin/$plugin.plugin.zsh ]; then
    source $PLUGINS_DIR/$plugin/$plugin.plugin.zsh
  elif [ -f $PLUGINS_DIR/ohmyzsh/plugins/$plugin/$plugin.plugin.zsh ]; then
    source $PLUGINS_DIR/ohmyzsh/plugins/$plugin/$plugin.plugin.zsh
  else
    echo "Plugin missing: $plugin at $PLUGINS_DIR/ohmyzsh/plugins/$plugin/$plugin.plugin.zsh"
  fi
done

fpath+=~/.zsh/plugins/pure
autoload -U promptinit; promptinit
autoload colors && colors
( prompt -l | grep -q pure ) && prompt pure || echo "'pure' prompt installation failed. Updating sobieconfig submodules could help."

export RPROMPT=''
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
local virtualenv=$(virtualenv_prompt_info)
export PROMPT='%D{%H:%M} $(virtualenv_prompt_info)${ret_status}%{$reset_color%}'
