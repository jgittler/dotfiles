#####################
# oh-my-zsh configs #
#####################

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="awesomepanda"

plugins=(git zsh-completions svn)

source $ZSH/oh-my-zsh.sh

######################
# custom zsh configs #
######################
source ~/.nvm/nvm.sh

# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL
export DISABLE_AUTO_TITLE=true

# aliases
alias lh='ls -alF'
alias home='cd ~/procore'
alias be='bundle exec'                                                          
alias vz='vim ~/dotfiles/zshrc'                                                         
alias vv='vim ~/dotfiles/vimrc'                                                         
alias vg='vim ~/dotfiles/gitconfig'
alias vt='vim ~/dotfiles/tmux.conf'
alias vpg='sudo vim /usr/local/var/postgres'
alias jump='cd ~/Documents/vagrant-ude-master/; vagrant up; vagrant ssh'
alias v='vim'
alias vi='vim'
alias vim='/usr/local/Cellar/vim/7.4.903/bin/vim'
alias startredis='redis-server /usr/local/etc/redis.conf'
alias startmem='/usr/local/opt/memcached/bin/memcached'
alias db='cat ~/Procore/procore/config/database.yml'
[[ -f ~/.aliases ]] && source ~/.aliases

# fuctions
check() {
  ps aux | grep $1
}

# paths
export PATH=/usr/local/rbenv/shims:/usr/local/rbenv/bin:/usr/local/redis/bin:/usr/local/pgsql/bin:./bin:/usr/local/abbyy/bin:$PATH
export RBENV_ROOT="/usr/local/rbenv"
eval "$(rbenv init - --no-rehash)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Elixir env var path
export PATH="$PATH:/path/to/elixir/bin"

# themekit path
PATH=/Users/jasongittler/.themekit:$PATH

# FZF
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# z.sh
# `brew --prefix`/etc/profile.d/z.sh
if command -v brew >/dev/null 2>&1; then
  [ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi
