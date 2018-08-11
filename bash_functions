#!/bin/bash

# utility
check() {
  ps aux | rg $1
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
  files=($(rg -l "$replaced"))
  for file in $files
  do
    sed -i '' "s/$replaced/$replace_with/" "$file"
  done
}

# nvim
vl() {
  _now=$(date +%Y-%m-%d:%H:%M:%S)
  _file="nvim-log-$_now.log"
  nvim $1 -V9$_file
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
    print -n "Do you want to upgrade and cleanup $(tput bold)${package}$(tput sgr0)? $(tput setaf 1)[y/n]$(tput sgr0) "
    read answer
    case "${answer}" in
      [y])
        brew upgrade $package && brew cleanup $package ;;
      [n])
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
  if [[ $(git branch | rg -c $1) == 1 ]]; then git branch | rg $1 | xargs git co; else git br | rg $1; fi
}

gitc() {
  _allowed_types=(feat fix docs style refactor test chore)
  if [[ ! $_allowed_types =~ (^| )$1($| ) ]]; then echo "Invalid commit message type: ${1}"; else
    if [ -z "$2" ]
    then
      git commit -m "$1: " -e
    else
      git commit -m "$1: $2"
    fi
  fi
}

git_delete_old_branches() {
  for branch in $(git br | rg months | cut -d ' ' -f1)
  do
    echo "Locally $(git branch -D ${branch})"
  done
}

# rails
rroutes() {
  brk routes | grep $1 | tr -s " " | sed -e "G;"
}

# elixir
mixff() {
  files=($(git ls-files -m))
  for file in $files
  do
    mix format $file
  done
}
