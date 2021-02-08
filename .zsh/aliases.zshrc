export EDITOR="nano"

if [[ -n $SSH_CONNECTION ]]; then
  alias zshrc="nano ~/.zshrc && source ~/.zshrc"
else
  alias zshrc="code -nw ~/.zsh && source ~/.zshrc"
  export VISUAL="code -nw"
fi

alias shc='shellcheck'

alias docker_clear='docker kill $(docker ps -q); docker rm $(docker ps -a -q)'
alias dlf='docker logs --follow'

alias f="fuck"
alias fy="fuck --yeah"
alias yb="yarn build"
alias yt="yarn test"
alias ylf="if grep -qs 'lint:fix' ./package.json; then yarn lint:fix; else yarn lint --fix; fi"
alias ylfp='yarn lint --fix && git add -u && git commit -m "Lint" && git push'
alias yif='yarn install --frozen-lockfile'
alias y='yarn'

alias dirs='dirs -v'

# Search contents of files. rhino <your string> <directory = . >
rhino() {
  grep -rHino "$1" "${2:-.}"
}

# https://github.com/microsoft/vscode/issues/105446#issuecomment-727079169
alias codelag='codesign --remove-signature /Applications/Visual\ Studio\ Code.app/Contents/Frameworks/Code\ Helper\ \(Renderer\).app'
