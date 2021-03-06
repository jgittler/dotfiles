# oh-my-zsh configs 
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="awesomepanda"

source $ZSH/oh-my-zsh.sh

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
. ~/dotfiles/aliases

# fuctions
. ~/dotfiles/bash_functions

# exercism
if [ -f ~/.config/exercism/exercism_completion.zsh ]; then
  . ~/.config/exercism/exercism_completion.zsh
fi

# paths
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/redis/bin:/usr/local/pgsql/bin:./bin:/usr/local/abbyy/bin:$PATH

# nvm
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# heroku
export PATH="/usr/local/bin/heroku:$PATH"

# Pyenv
# export PATH="/Users/jasongittler/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

# themekit
export PATH="/Users/jasongittler/.themekit:$PATH"

# erlang
export PATH="/usr/local/bin/kerl:$PATH"

# elixir
source "$HOME/.kiex/scripts/kiex"
PATH="/Users/jasongittler/.mix/escripts:$PATH"

# vs code
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

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
