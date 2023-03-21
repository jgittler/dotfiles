#!/bin/bash

# utility
check() {
  ps aux | rg $1
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

# git
gitfco() {
  if [[ $(git branch | rg -c $1) == 1 ]]; then git branch | rg $1 | xargs git co; else git br | rg $1; fi
}

git_delete_old_branches() {
  for branch in $(git br | rg months | cut -d ' ' -f1)
  do
    case "$1" in
      --dry)
        echo "Locally Deleting ${branch}"
        ;;
      *)
        echo "Locally $(git branch -D ${branch})"
        ;;
    esac
  done
}

# PHP
sphp() {
  current_v=($(php -v | head -n 1 | cut -c 5-7))
  brew unlink "php@${current_v}"
  if [ $# -eq 0 ]
  then
    brew link php
  else
    brew link "php@${1}"
  fi
}

# Docker
drmc() {
  all_containers=($(docker ps -a --format '{{.ID}}'))
  docker stop "${all_containers[@]}"
  docker rm "${all_containers[@]}"
}

dsac() {
  all_containers=($(docker ps -a --format '{{.ID}}'))
  docker stop "${all_containers[@]}"
}

drmi() {
  all_images=($(docker images -a --format '{{.ID}}'))
  docker rmi "${all_images[@]}"
}

denter() {
  docker exec -it "${1}" /bin/bash
}

drmc_by_img() {
  docker rm $(docker stop $(docker ps -a -q --filter ancestor=$1 --format="{{.ID}}"))
}
