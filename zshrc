# oh-my-zsh configs 
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="awesomepanda"

plugins=(git zsh-completions svn)

source $ZSH/oh-my-zsh.sh

# zsh configs
source ~/.nvm/nvm.sh

# use nvim as the visual editor
export VISUAL=nvim
export EDITOR=$VISUAL
export DISABLE_AUTO_TITLE=true

# ls colors
export CLICOLOR=1
export LSCOLORS="gxfxcxdxBxeggdabhegcAd"

# history
HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups
setopt append_history
setopt hist_ignore_space
setopt inc_append_history
setopt inc_append_history_time
setopt extended_history

# aliases
. ~/.aliases

# fuctions
. ~/.bash_functions

# exercism
if [ -f ~/.config/exercism/exercism_completion.zsh ]; then
  . ~/.config/exercism/exercism_completion.zsh
fi

# paths
export PATH=/usr/local/bin:/usr/local/redis/bin:/usr/local/pgsql/bin:./bin:/usr/local/abbyy/bin:$PATH

# heroku
export PATH="/usr/local/bin/heroku:$PATH"
# tmuxinator
source ~/dotfiles/tmuxinator.zsh

# themekit
PATH="/Users/jasongittler/.themekit:$PATH"

# erlang
PATH="/usr/local/bin/kerl:$PATH"

# elixir
source "$HOME/.kiex/scripts/kiex"

# z stuff
if command -v brew >/dev/null 2>&1; then
  [ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi

# Syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--color --reverse"
