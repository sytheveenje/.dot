export EDITOR=vim
export VISUAL=vim

alias vim='/usr/local/bin/vim'
alias be='bundle exec '
alias bower='noglob bower'
alias wf='ssh baardbaard@baarbaard.webfactional.com'
alias burst='sleep 1500; terminal-notifier -message "Pauze, yay!" -title "Break" &'

# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Source Composer
export PATH="$PATH:$HOME/.composer/vendor/bin"

# Source Rbenv
export PATH="$HOME/.rbenv/bin:$PATH" # Add Rbenv to PATH
eval "$(rbenv init -)"

# Find MSYQL
export PATH="/usr/local/mysql/bin:$PATH"

setopt auto_cd        # Change directory by typing a directory name on its own.
setopt extended_glob  # Turn on the more powerful pattern matching features.

# Add CD paths
cdpath=($HOME/Sites)

# Vim in ZSH settings
bindkey -v
export KEYTIMEOUT=1
