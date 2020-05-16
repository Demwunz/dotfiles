if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH. #############
export PATH=$HOME/bin:/usr/local/bin:$PATH
# cargo | brew install cargo
export PATH=$HOME/.cargo/bin:$PATH
# Homebrew requires this #
export PATH="/usr/local/sbin:$PATH"

# flutter stuff ##########################################################
export INTEL_HAXM_HOME=/usr/local/Caskroom/intel-haxm
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

# NPM log level (silent, error,warn, verbose, silly) #####################
export npm_config_loglevel=silent

# fd, fzf | brew install fd fzf ##########################################
# https://github.com/junegunn/fzf#tips
# find files anywhere
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# https://mike.place/2017/fzf-fd/
# search within files in current directory
export FZF_ALT_C_COMMAND="rg --sort-files --files --null 2> /dev/null | xargs -0 dirname | uniq"

# highlight keyword when using up//down to complete current command ######
typeset -g HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=green,bold'
typeset -g HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=magenta,bold'

# curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# - Aliases ##############################################################
source $HOME/.aliases

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p $HOME/.zinit
    command git clone https://github.com/zdharma/zinit $HOME/.zinit/bin && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%F" || \
        print -P "%F{160}▓▒░ The clone has failed.%F"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of zinit installer's chunk #######################################

zinit ice blockf;

zinit ice as"program" pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX"

zinit ice wait lucid atload'_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

zinit ice wait'1b' lucid blockf
zinit light changyuheng/fz

zinit ice wait'1a' lucid blockf
zinit light rupa/z

zinit ice wait'1' lucid
zinit light laggardkernel/zsh-thefuck

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting

zinit light zsh-users/zsh-history-substring-search

#zinit snippet OMZ::plugins/asdf/asdf.plugin.zsh
zinit snippet OMZ::plugins/dotenv/dotenv.plugin.zsh
zinit snippet OMZ::plugins/fzf/fzf.plugin.zsh
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZ::plugins/heroku/heroku.plugin.zsh
zinit snippet OMZ::plugins/safe-paste/safe-paste.plugin.zsh
zinit snippet 'https://github.com/lincheney/fzf-tab-completion/blob/master/zsh/fzf-zsh-completion.sh'

zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit pack for ls_colors

# zsh settings ###########################################################
# up and down keys for substring searches
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
# dont store repeated commands in history once is enough. only add new ones
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt inc_append_history
# fzf tab completion | https://github.com/lincheney/fzf-tab-completion ###
zstyle ':completion:*' fzf-search-display true

# https://github.com/nvbn/thefuck | brew install thefuck #################
eval $(thefuck --alias oops)

# https://asdf-vm.com/ | brew install asdf ###############################
. $(brew --prefix asdf)/asdf.sh
# https://github.com/asdf-vm/asdf/issues/692#issuecomment-615019168
# fpath=(${ASDF_DIR}/completions $fpath)

# https://github.com/junegunn/fzf | brew install fzf #####################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# https://gist.github.com/ctechols/ca1035271ad134841284  #################
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
        compinit;
else
        compinit -C;
fi;

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh. #########
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
