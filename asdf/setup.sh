#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR" || exit

. ../scripts/functions.sh

SOURCE="$(realpath .)"
DESTINATION="$(realpath ~)"

info "Configuring asdf..."

find . -type f -name ".tool-versions" | while read fn; do

    fn=$(basename "$fn")
    symlink "$SOURCE/$fn" "$DESTINATION/$fn"

    info "Installing $1 runtime..."

    while read package; do
        install="asdf install $package"
        global="asdf global $package"
        set -- $install
        set -- $global
        runtime="${package%' '*}"

        if [[ $runtime == "nodejs" ]];then
            substep_info "Importing the Node.js release team's OpenPGP keys to main keyring:"
                sh ~/.asdf/plugins/nodejs/bin/import-release-team-keyring;
        fi

        substep_info "Installing $package..."
        $install
        $global

    done < "$fn"

    success "Finished installing $1"

done

success "Finished configuring asdf."
