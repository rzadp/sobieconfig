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
