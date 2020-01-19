#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR" || exit

. ../scripts/functions.sh

SOURCE="$(realpath .)"
DESTINATION="$(realpath ~/)"

info "Setting up bash settings..."

find . -type f -name ".*" | while read dotfile; do
    dotfile=$(basename "$dotfile")
    symlink "$SOURCE/$dotfile" "$DESTINATION/$dotfile"
done

success "Finished setting up bash"
