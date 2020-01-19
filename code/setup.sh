#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR" || exit

. ../scripts/functions.sh

SOURCE="$(realpath .)"
DESTINATION="$(realpath ~/Library/Application\ Support/Code/User/)"

info "Setting up Visual Studio Code..."

# keybindings.json settings.json
find * -type f -name "*.json" | while read fn; do
    fn=$(basename "$fn")
    symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done

success "Finished setting up Visual Studio Code"
