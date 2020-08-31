alias sobieconfig='/usr/bin/git --git-dir=$HOME/sobieconfig/ --work-tree=$HOME'
alias sc='sobieconfig'
sobieconfig config --local status.showUntrackedFiles no
alias sobieconfig_push='sobieconfig add -u && sobieconfig commit -m "sobieconfig" && sobieconfig push'
