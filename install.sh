#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR" || exit

. scripts/functions.sh

info "Prompting for sudo password..."

if sudo -v; then
    # Keep-alive: update existing `sudo` time stamp until `setup.sh` has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
    success "Sudo credentials updated."
else
    error "Failed to obtain sudo credentials."
fi

info "Installing XCode command line tools..."
if xcode-select --print-path &>/dev/null; then
    success "XCode command line tools already installed."
elif xcode-select --install &>/dev/null; then
    success "Finished installing XCode command line tools."
else
    error "Failed to install XCode command line tools."
fi

# https://github.com/sam-hosseini/dotfiles/blob/master/bootstrap.sh#L53
info "Installing Homebrew"
if hash brew 2>/dev/null; then
    success "Homebrew already exists"
else
    url=https://raw.githubusercontent.com/Homebrew/install/master/install
    if yes | /usr/bin/ruby -e "$(curl -fsSL ${url})"; then
        success "Homebrew installation succeeded"
    else
        error "Homebrew installation failed"
        exit 1
    fi
fi

# Package control must be executed first in order for the rest to work
./packages/setup.sh

find * -name "setup.sh" -not -wholename "packages*" | while read setup; do
    ./$setup
done

success "Finished installing Dotfiles"
