# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH. ############
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Homebrew requires this ################################################
export PATH="/usr/local/sbin:$PATH"

# NPM log level (silent, error,warn, verbose, silly) ####################
export npm_config_loglevel=silent

# fd, fzf | brew install fd fzf #########################################
# https://github.com/junegunn/fzf#tips 
# find files anywhere
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# https://mike.place/2017/fzf-fd/
# search within files in current directory
export FZF_ALT_C_COMMAND="rg --sort-files --files --null 2> /dev/null | xargs -0 dirname | uniq"

# - Aliases #############################################################
source $HOME/.aliases

# http://zdharma.org/zplugin/ | brew install zplugin ####################
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin 

### End of Zplugin installer's chunk ####################################
zplugin ice blockf;

zplugin ice as"program" pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX"

zplugin ice wait lucid atload'_zsh_autosuggest_start'
zplugin light zsh-users/zsh-autosuggestions

zplugin ice wait'1b' lucid blockf
zplugin light changyuheng/fz

zplugin ice wait'1a' lucid blockf
zplugin light rupa/z

zplugin ice wait'1' lucid
zplugin light laggardkernel/zsh-thefuck

zplugin light zsh-users/zsh-completions
zplugin light zsh-users/zsh-syntax-highlighting
zplugin light zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

zplugin snippet OMZ::plugins/asdf/asdf.plugin.zsh
zplugin snippet OMZ::plugins/dotenv/dotenv.plugin.zsh
zplugin snippet OMZ::plugins/fzf/fzf.plugin.zsh
zplugin snippet OMZ::plugins/git/git.plugin.zsh
zplugin snippet OMZ::plugins/heroku/heroku.plugin.zsh
zplugin snippet OMZ::plugins/safe-paste/safe-paste.plugin.zsh
zplugin snippet OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh

zplugin ice depth=1; zplugin light romkatv/powerlevel10k

# https://gist.github.com/ctechols/ca1035271ad134841284  ################
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
	compinit;
else
	compinit -C;
fi;

# https://github.com/nvbn/thefuck | brew install thefuck ################
eval $(thefuck --alias)

# https://asdf-vm.com/ | brew install asdf ###############################
. /usr/local/opt/asdf/asdf.sh
. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

# https://github.com/junegunn/fzf | brew install fzf #####################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# highlight keyword when using up//down to complete current command
typeset -g HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=green,bold'
typeset -g HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=magenta,bold'

# curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh. #########
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh