# If you come from bash you might have to change your $PATH. #############
export PATH=$HOME/bin:/usr/local/bin:$PATH
# cargo | brew install cargo
export PATH=$HOME/.cargo/bin:$PATH
# Homebrew requires this #
export PATH="/usr/local/sbin:$PATH"

# export brew python
export PATH=/usr/local/bin:/usr/local/sbin:~/bin:$PATH

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