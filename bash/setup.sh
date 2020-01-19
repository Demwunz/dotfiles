#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR" || exit

. ../scripts/functions.sh

SOURCE="$(realpath .)"
DESTINATION="$(realpath ~/)"

info "Setting up bash settings..."

find . -type f -name ".*" | while read fn; do
    fn=$(basename "$fn")
    symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done

success "Finished setting up bash"
