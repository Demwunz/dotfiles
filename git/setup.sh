#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR" || exit

. ../scripts/functions.sh

SOURCE="$(realpath .)"
DESTINATION="$(realpath ~)"

info "Configuring git..."

find . -type f -name ".git*" | while read fn; do
    fn=$(basename "$fn")
    symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done

success "Finished configuring git."
