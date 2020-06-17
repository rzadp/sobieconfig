export VISUAL="code -nw"
export EDITOR="nano"

if [[ -n $SSH_CONNECTION ]]; then
  alias zshrc="nano ~/.zshrc && source ~/.zshrc"
else
  alias zshrc="code -nw ~/.zsh && source ~/.zshrc"
fi

alias sc='shellcheck'

alias docker_clear='docker kill $(docker ps -q); docker rm $(docker ps -a -q)'

alias f="fuck"
alias fy="fuck --yeah"
alias yb="yarn build"
alias yt="yarn test"
alias ylf="yarn lint --fix"
alias ylfp='yarn lint --fix && git add -u && git commit -m "Lint" && git push'
alias yif='yarn install --frozen-lockfile'
alias gc='git commit'

alias ci='hub ci-status -v'
alias pr='hub pr list -f "  %pC#: %I%Creset (by: %au) (reviewing: %rs)  %t%  l%n"'
alias prune="git fetch -p && (git checkout -q origin/master || git checkout -q origin/dev); git branch -vv | grep ': gone]' | awk '{print \$1}' | xargs git branch -D"
