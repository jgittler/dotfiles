# oh-my-zsh configs 
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="awesomepanda"

plugins=(git zsh-completions svn)

source $ZSH/oh-my-zsh.sh

# zsh configs
source ~/.nvm/nvm.sh

# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL
export DISABLE_AUTO_TITLE=true

# aliases
. ~/.aliases

# fuctions
. ~/.bash_functions

# paths
export PATH=/usr/local/bin:/usr/local/redis/bin:/usr/local/pgsql/bin:./bin:/usr/local/abbyy/bin:$PATH

# rbenv
eval "$(rbenv init -)"

# added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# tmuxinator
source ~/dotfiles/tmuxinator.zsh

# Elixir env var path
source "$HOME/.kiex/scripts/kiex"

# themekit path
PATH="/Users/jasongittler/.themekit:$PATH"

# z stuff
if command -v brew >/dev/null 2>&1; then
  [ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi

# Syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="/usr/local/bin:$PATH"
