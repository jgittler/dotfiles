# utility
check() {
  ps aux | grep $1
}

usage() {
  _limit=${1:-"5"}
  _sort=${1:-"3"} # %CPU
  v=$(stty size | cut -d ' ' -f2)
  ps aux | cut -c1-$v | head -n "$_limit" | sort -nrk "$_sort"
}

# vim
vl() {
  _now=$(date +%Y-%m-%d:%H:%M:%S)
  _file="vim-log-$_now.log"
  vim $1 -V9$_file
}

# homebrew
brewupgrade() {
  for package in "$@"
  do
    brew upgrade $package && brew cleanup $package
  done
}

brewupdate() {
  brew update
  brew outdated | xargs -0 -I package read -p 'Do you want to upgrade and cleanup ${package}? [yY/nN] ' answer; case "${answer}" in [yY]) $(brew uprgade $package && brew cleanup $package) ;; [nN]) $(echo 'no') ;; esac
}

# themekit
themeinit() {
  if theme update ; then
    theme watch
  else
    theme watch
  fi
}

# git
gitfco() {
  if [[ $(git br | grep -c $1) == 1 ]]; then git br | grep $1 | xargs git co; else git br | ag $1; fi
}

# rails
frailsroutes() {
  brk routes | grep $1 | tr -s " " | sed -e "G;"
}
