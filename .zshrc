export EDITOR=vim
export VISUAL=vim

alias vim='/usr/local/bin/vim'
alias mux='/Users/stef/.rvm/gems/ruby-2.1.1/bin/tmuxinator'
alias be='bundle exec '
alias bower='noglob bower'
alias wf='ssh baardbaard@baarbaard.webfactional.com'

# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Source RVM
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Find MSYQL
# export PATH=$PATH:/Applications/MAMP/Library/bin
export PATH="/usr/local/mysql/bin:$PATH"

# WP-CLI directory
# export PATH=/Users/stef/.wp-cli/bin:$PATH
export WP_CLI_PHP=/Applications/MAMP/bin/php/php5.3.20/bin/php

# WP-CLI Bash completions
autoload bashcompinit
bashcompinit
# source $HOME/.wp-cli/vendor/wp-cli/wp-cli/utils/wp-completion.bash
source ~/bin/wp-completion.bash

# Disable control flow so ^s is available in Vim
stty -ixon -ixoff 

bindkey -v				# Use Vim line editting
setopt auto_cd			# Change directory by typing a directory name on its own.
setopt extended_glob	# Turn on the more powerful pattern matching features.

# Add CD paths
cdpath=($HOME/Sites)
