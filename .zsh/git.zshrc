if [[ "$OSTYPE" = darwin* ]]; then
  # macOS
  # export GIT_EDITOR="/Applications/Komet.app/Contents/MacOS/Komet"
  # git config --global core.editor "/Applications/Komet.app/Contents/MacOS/Komet"

  export GIT_EDITOR="nano"
  git config --global core.editor "nano"
else
  :
fi

git config --global user.email "roopert7@gmail.com"
git config --global user.name "rzadp"
git config --global merge.tool vscode
git config --global merge.vscode.cmd "code --wait $MERGED"

git() {
  echo "Using git alias"
  exit -1
  /usr/bin/git $@
}

alias gc='git commit'
alias gpsu='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD 2>/dev/null)'
alias gst='git status'
alias gs='git status'

alias ci='hub ci-status -v'
alias pr='hub pr list -f "  %pC#: %I%Creset (by: %au) (reviewing: %rs)  %t%  l%n"'
alias prune="git fetch -p && (git checkout -q origin/master || git checkout -q origin/dev); git branch -vv | grep ': gone]' | awk '{print \$1}' | xargs git branch -D"

alias sobieconfig='/usr/bin/git --git-dir=$HOME/sobieconfig/ --work-tree=$HOME'
alias sc='sobieconfig'
sobieconfig config --local status.showUntrackedFiles no
alias sc_push='sobieconfig add -u && sobieconfig commit -m "sobieconfig" && sobieconfig push'

alias lg='lazygit'
alias lsc='lazygit --git-dir=$HOME/sobieconfig --work-tree=$HOME'
