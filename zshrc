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

export PATH=/usr/local/bin:$PATH

# nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# vs code
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

# z stuff
if command -v brew >/dev/null 2>&1; then
  [ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi

# Syntax highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# mise
eval "$(mise activate)"

# psql
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--color --reverse"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jasongittler/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jasongittler/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jasongittler/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jasongittler/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
