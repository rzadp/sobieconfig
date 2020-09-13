if [ -x "$(command -v tmux)" ] && [ -z "$TMUX" ] && [ -n "$SSH_TTY" ] && [[ $- =~ i ]]; then
  # always have a tmux over ssh to make sure connections stays lest there is network issue
  tmux new-session -A -s sobietmux
  exit # Exit because all the following stuff will be loaded when creating the new tmux session
fi

export PATH="/usr/local/bin:$HOME/.yarn/bin:/opt/bin:$PATH:/snap/bin:$HOME/Library/Python/3.7/bin:$HOME/.local/bin:$HOME/.local/lib/python3.5/site-packages:/Library/TeX/texbin:/usr/local/bin:/usr/local/opt/rabbitmq/sbin:$HOME/bin:/sbin:/usr/sbin:$HOME/.zsh/pure"
export PATH="/opt/bin:$HOME/.gem/ruby/2.6.0/bin:$PATH:/snap/bin:$HOME/Library/Python/3.7/bin:$HOME/.local/bin:$HOME/.local/lib/python3.5/site-packages:/Library/TeX/texbin:/usr/local/bin:/usr/local/opt/rabbitmq/sbin:$HOME/bin:/usr/local/bin:/sbin:/usr/sbin:$HOME/.zsh/pure"
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
export PATH=$PATH:/Users/przemek/Library/Python/2.7/bin

# Load all stock functions
autoload -U compaudit compinit
autoload -U +X compinit && compinit

source $HOME/.profile

source ~/.zsh/sobieconfig.zshrc
source ~/.zsh/git.zshrc
source ~/.zsh/aliases.zshrc
source ~/.zsh/programs.zshrc
source ~/.zsh/ethworks.zshrc
source ~/.zsh/history.zshrc
source ~/.zsh/theme.zshrc
