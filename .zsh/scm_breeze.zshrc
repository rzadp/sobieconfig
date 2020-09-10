#https://github.com/scmbreeze/scm_breeze
local thisDir="$(dirname ${BASH_SOURCE:-$0})"
export scmbDir="$thisDir/plugins/scm_breeze"

# Load config
. "$thisDir/.scmbrc"

# Shared functions
source "$scmbDir/lib/scm_breeze.sh"
# Design assets management
source "$scmbDir/lib/design.sh"

# Git
# ------------------------------------------------------------
if [[ -s "$thisDir/.git.scmbrc" ]]; then
  # Load git config
  source "$thisDir/.git.scmbrc"
  source "$scmbDir/lib/git/helpers.sh"
  source "$scmbDir/lib/git/aliases.sh"
  source "$scmbDir/lib/git/keybindings.sh"
  source "$scmbDir/lib/git/status_shortcuts.sh"
  source "$scmbDir/lib/git/branch_shortcuts.sh"
  source "$scmbDir/lib/git/grep_shortcuts.sh"
  source "$scmbDir/lib/git/shell_shortcuts.sh"
  source "$scmbDir/lib/git/repo_index.sh"
  source "$scmbDir/lib/git/tools.sh"

  if ! type ruby > /dev/null 2>&1; then
    # If Ruby is not installed, fall back to the
    # slower bash/zsh implementation of 'git_status_shortcuts'
    source "$scmbDir/lib/git/fallback/status_shortcuts_shell.sh"
  fi
fi

