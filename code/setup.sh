#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR" || exit

. ../scripts/functions.sh

SOURCE="realpath ."
DESTINATION="realpath ~/Library/Application\ Support/VSCodium/User/"

info "Setting up VSCodium..."

# keybindings.json settings.json
# find * -type f -name "*.json" | while read fn; do
#     fn=$(basename "$fn")
#     stow --adopt --simulate --ignore='setup.sh' --target="$(realpath ~/Library/Application\ Support/VSCodium/User)" --dir="$(realpath .)" . -v
# done

success "Finished setting up VSCodium"
