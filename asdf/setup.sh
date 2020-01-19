#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR" || exit

. ../scripts/functions.sh

SOURCE="$(realpath .)"
DESTINATION="$(realpath ~)"

info "Configuring asdf..."

find * -type f -name ".tool-versions" | while read fn; do
    fn=$(basename "$fn")
    symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done

find * -type f -name "*.list" | while read fn; do
    cmd="${fn%.*}"
    set -- $cmd
    install="$cmd install"
    global="$cmd global"

    info "Installing $1 runtime..."

    while read package; do

        runtime="${package%' '*}"

        if [[ $runtime == "nodejs" ]];then
            substep_info "Importing the Node.js release team's OpenPGP keys to main keyring:"
                sh ~/.asdf/plugins/nodejs/bin/import-release-team-keyring;
        fi

        substep_info "Installing $package..."
        $install $package
        $global $package
        substep_success "$package set to global"

    done < "$fn"

    success "Finished installing $1"
done

success "Finished configuring asdf."
