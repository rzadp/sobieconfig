export EDITOR="nano"

if [[ -n $SSH_CONNECTION ]]; then
  alias zshrc="nano ~/.zshrc && source ~/.zshrc"
else
  alias zshrc="code -nw ~/.zsh && source ~/.zshrc"
  export VISUAL="code -nw"
fi

alias shc='shellcheck'

alias docker_clear='docker kill $(docker ps -q); docker rm $(docker ps -a -q)'

alias f="fuck"
alias fy="fuck --yeah"
alias yb="yarn build"
alias yt="yarn test"
alias ylf="yarn lint --fix"
alias ylfp='yarn lint --fix && git add -u && git commit -m "Lint" && git push'
alias yif='yarn install --frozen-lockfile'
alias y='yarn'

alias dirs='dirs -v'
