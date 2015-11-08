export EDITOR=vim
export VISUAL=vim

alias vim='/usr/local/bin/vim'
# alias mux='/Users/stef/.rvm/gems/ruby-2.1.1/bin/tmuxinator'
alias be='bundle exec '
alias bower='noglob bower'
alias wf='ssh baardbaard@baarbaard.webfactional.com'

# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Source Rbenv
export PATH="$HOME/.rbenv/bin:$PATH" # Add Rbenv to PATH
eval "$(rbenv init -)"

# Find MSYQL
export PATH="/usr/local/mysql/bin:$PATH"

setopt auto_cd        # Change directory by typing a directory name on its own.
setopt extended_glob  # Turn on the more powerful pattern matching features.

# Add CD paths
cdpath=($HOME/Sites)
