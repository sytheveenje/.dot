COLOR_RED='\[\e[31m\]'
COLOR_YELLOW='\[\e[33m\]'
COLOR_RESET='\[\e[0m\]'
PS1='['${COLOR_RED}'\A'${COLOR_RESET}'] '${COLOR_RED}'\u'${COLOR_RESET}'@'${COLOR_RED}'\h'${COLOR_RESET}':\w '${COLOR_RED}'$ '${COLOR_RESET}
#PS1='[\A]' ${COLOR_RED}'\u'${COLOR_RESET}'@\h:\w $ '
PATH=/usr/local/bin:${PATH}
set -o vi

# Overwrite terminal's flow control so CTRL + S can be used to split windows horizontally
stty -ixon -ixoff
