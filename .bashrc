# Aliasses
# alias l='ls -G'
# alias ll='ls -lahG'
# alias wf='ssh baardbaard@baardbaard.webfactional.com'
# alias vim='/usr/local/bin/vim'

# # Set Vim as editor
# export EDITOR='vim'

# if [[ "$TERM" != "screen-256color" ]]
# then
# 	tmux attach-session -t "$USER" || tmux new-session -s "$USER"
# 	exit
# fi

# # Git branch in prompt.
# parse_git_branch() {
# 	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
# }

# COLOR_RED='\[\e[31m\]'
# COLOR_YELLOW='\[\e[33m\]'
# COLOR_RESET='\[\e[0m\]'

# PS1='['${COLOR_RED}'\A'${COLOR_RESET}'] '${COLOR_RED}'\u'${COLOR_RESET}'@'${COLOR_RED}'\h'${COLOR_RESET}':\w'${COLOR_YELLOW}'$(parse_git_branch)'${COLOR_RESET}''${COLOR_RED}' $ '${COLOR_RESET}

# export CLICOLOR=1
# export LSCOLORS=GxFxCxDxBxegedabagaced

# PATH=/usr/local/bin:${PATH}
# set -o vi

# # Overwrite terminal's flow control so CTRL + S can be used to split windows horizontally
# stty -ixon -ixoff

# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
