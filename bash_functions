#!/bin/bash

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

replace() {
  replaced="$1"; shift
  replace_with="$1"; shift
  files=($(ag -l "$replaced"))
  for file in $files
  do
    sed -i '' "s/$replaced/$replace_with/" "$file"
  done
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
  for package in $(brew outdated)
  do
    print -n "Do you want to upgrade and cleanup $(tput bold)${package}$(tput sgr0)? $(tput setaf 1)[yY/nN]$(tput sgr0) "
    read answer
    case "${answer}" in
      [yY])
        brew upgrade $package && brew cleanup $package ;;
      [nN])
        echo "passed on updating $(tput bold)${package}$(tput sgr0)" ;;
    esac
  done
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
