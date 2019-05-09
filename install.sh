#! /bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

create_symlinks() {
    declare -a FILES_TO_SYMLINK=(
        "gitconfig"
        "vimrc"
    )

    local i=""
    local sourceFile=""
    local targetFile=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    skip_questions "$@" \
        && skipQuestions=true

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for i in "${FILES_TO_SYMLINK[@]}"; do
        sourceFile="$(pwd)/$i"
        targetFile="$HOME/.$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"

        if [ ! -e "$targetFile" ] || $skipQuestions; then
            execute \
                "ln -fs $sourceFile $targetFile" \
                "$targetFile -> $sourceFile"
        elif [ "$(readlink "$targetFile")" == "$sourceFile" ]; then
            print_success "$targetFile -> $sourceFile"
        else
            if ! $skipQuestions; then
                ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"
                if answer_is_yes; then
                    rm -rf "$targetFile"

                    execute \
                        "ln -fs $sourceFile $targetFile"
                        "$targetFile -> $sourceFile"
                else
                    print_error "$targetFile -> $sourceFile"
                fi
            fi
        fi
    done
}


install_vim_plugins() {
    declare -r MOLOKAI_THEME_URL="https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim"
    declare -r VIM_PLUG_INSTALL_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

    execute \
        "curl -fLo ~/.vim/colors/molokai.vim --create-dirs $MOLOKAI_THEME_URL"

    execute \
        "curl -fLo ~/.vim/autoload/plug.vim --create-dirs $VIM_PLUG_INSTALL_URL"

    vim +PlugInstall
}


main() {
    print_in_purple "\n • Create symbolic links\n\n"
    install_vim_plugins
    create_symlinks "$@"
}

main "$@"

