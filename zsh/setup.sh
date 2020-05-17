#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR" || exit

. ../scripts/functions.sh

info "Setting up zsh shell..."

set_brew_zsh() {
    current="$(which $SHELL)"
    brewzsh='/usr/local/bin/zsh'

    if [[ "$current" ==  $brewzsh ]]; then
        success "zsh shell via brew is already set up."
    else
        info "changing shell to brew zsh version, password required..."
        sudo echo $brewzsh >> /etc/shells
        # sudo dscl . -create /Users/$USER UserShell $brewzsh
        substep_info "Using $brewzsh to install zsh dependencies"
        exec $brewzsh

        substep_info "Installing zinit for zsh"
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
        source ~/.zshrc
    fi
}

if set_brew_zsh; then
    success "Successfully set up brew zsh shell."
else
    error "Failed setting up zsh shell."
fi

