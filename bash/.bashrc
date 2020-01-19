# aliases  #########################################################################
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# fzf | brew install fzf ###########################################################
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# - Aliases #############################################################
source $HOME/.aliases

# bash completion | brew install bash-completion@2 #################################
 export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"