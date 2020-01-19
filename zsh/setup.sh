#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR" || exit

. ../scripts/functions.sh

SOURCE="$(realpath .)"
DESTINATION="$(realpath ~/)"

info "Setting up zsh shell..."

find . -type f -name ".*" | while read fn; do
    fn=$(basename "$fn")
    symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done

set_brew_zsh() {
    current="$(which zsh)"

    if [[ "$current" == '/usr/local/bin/zsh' ]]; then
        success "zsh shell is already set up."
    else
        info "changing zsh to updated brew version, password required..."
        # https://rick.cogley.info/post/use-homebrew-zsh-instead-of-the-osx-default/
        sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh
        substep_info "ZSH will be changed to brew version when you restart your terminal"
    fi
}

if set_brew_zsh; then
    success "Successfully set up brew zsh shell."
else
    error "Failed setting up zsh shell."
fi
