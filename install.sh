#! /bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

create_symlinks() {
    declare -a SYMLINKS=(
        "gitconfig:$HOME/.gitconfig"
        "codex/AGENTS.md:$HOME/.codex/AGENTS.md"
    )

    local item=""
    local sourceFile=""
    local targetFile=""
    local targetDir=""
    local skipQuestions=false

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    skip_questions "$@" \
        && skipQuestions=true

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for item in "${SYMLINKS[@]}"; do
        sourceFile="$(pwd)/${item%%:*}"
        targetFile="${item#*:}"
        targetDir="$(dirname "$targetFile")"

        if [ ! -d "$targetDir" ]; then
            mkd "$targetDir"
        fi

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
                        "ln -fs $sourceFile $targetFile" \
                        "$targetFile -> $sourceFile"
                else
                    print_error "$targetFile -> $sourceFile"
                fi
            fi
        fi
    done
}

main() {
    print_in_purple "\n • Create symbolic links\n\n"
    create_symlinks "$@"
}

main "$@"
