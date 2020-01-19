#  source the bashrc file ###########################################################
[ -r ~/.bashrc ] && . ~/.bashrc

# https://asdf-vm.com/ | brew install asdf ##########################################
. /usr/local/opt/asdf/asdf.sh
. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash
#####################################################################################
export PATH="/usr/local/sbin:$PATH"

# fd, fzf | brew install fd fzf #########################################
# https://github.com/junegunn/fzf#tips 
export FZF_DEFAULT_COMMAND='fd --type f'
# https://mike.place/2017/fzf-fd/ 
export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"

# curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# https://github.com/nvbn/thefuck | brew install thefuck ############################
eval "$(thefuck --alias)"

# https://starship.rs/ | brew install starship ######################################
eval "$(starship init bash)"