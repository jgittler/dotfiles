#####################
# oh-my-zsh configs #
#####################

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="muse"

COMPLETION_WAITING_DOTS="true"

plugins=(themes)
# plugins=(ruby cp autojump command-not-found lol sprunge git gitfast git_remote_branch rails bundler rbenv rake capistrano colored-man colorize dirpersist history profiles vundle rand-quote)

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
alias vpg='vim /etc/postgresql/9.4/main'
alias jump='cd ~/Documents/vagrant-ude-master/; vagrant up; vagrant ssh'
alias v='vim'
alias vi='vim'
alias vim='/usr/local/Cellar/vim/7.4.903/bin/vim'
alias startredis='redis-server /usr/local/etc/redis.conf'
[[ -f ~/.aliases ]] && source ~/.aliases

# fuctions
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.zsh
check() {
  ps aux | grep $1
}

# paths
export PATH=/usr/local/rbenv/shims:/usr/local/rbenv/bin:/usr/local/redis/bin:/usr/local/pgsql/bin:./bin:/usr/local/abbyy/bin:$PATH
export RBENV_ROOT="/usr/local/rbenv"
eval "$(rbenv init - --no-rehash)"

function git_prompt_info() {
ref=$(git symbolic-ref HEAD 2> /dev/null) || return
echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# FZF
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
