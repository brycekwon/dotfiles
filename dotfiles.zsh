#!/usr/bin/env zsh


# exit immediately if a command exists with a non-zero status
set -euo pipefail

SUCCESS=0
FAILURE=1

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DOTFILES_SRC="${SCRIPT_DIR}/home"
DOTFILES_DST="$HOME"

function __dotfiles_usage() {
    printf "Usage: ./dotfiles.zsh <command>\n\n"
    printf "Commands:\n"
    printf "    %-10s install dotfiles to the target destination.\n" "install"
    printf "    %-10s install homebrew packages from the Brewfile.\n" "brew"
    printf "    %-10s clean installed dotfiles from the target destination.\n" "clean"
    printf "    %-10s set predefined configuration options for macos.\n" "config"
}

function __dotfiles_install() {
    find "$DOTFILES_SRC" -type f -print0 | while IFS= read -r -d $'\0' src_file; do
        if [[ "${src_file##*/}" == .* ]]; then
            continue
        fi

        rel_file="${src_file#$DOTFILES_SRC/}"
        if [[ "$rel_file" == dot-* ]]; then
            dst_file="$DOTFILES_DST/.${rel_file#dot-}"
        fi

        echo "$src_file ==> $dst_file"
        mkdir -p "$(dirname "$dst_file")"
        ln -sfn "$src_file" "$dst_file"
    done
}

function __dotfiles_brew() {

}

function __dotfiles_clean() {
    find "$DOTFILES_SRC" -type f -print0 | while IFS= read -r -d $'\0' src_file; do
        if [[ "${src_file##*/}" == .* ]]; then
            continue
        fi

        rel_file="${src_file#$DOTFILES_SRC/}"
        if [[ "$rel_file" == dot-* ]]; then
            dst_file="$DOTFILES_DST/.${rel_file#dot-}"
        fi

        echo "$dst_file"
        rm "$dst_file"
    done
}

function __dotfiles_config() {
    # keep-alive: update existing `sudo` timestamp until script has finished
    if [[ -z $"{CI}" ]]; then
        printf "sudo access is required for running this script"

        sudo -v
        while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
    fi

    launchctl config user umask 077

    # increase keyboard repeat rate
    defaults write -g InitialKeyRepeat -int 15
    defaults write -g KeyRepeat -int 1

    # decrease animation time for dock
    defaults write com.apple.dock autohide-time-modifier -float 0.15
    defaults write com.apple.dock autohide-delay -int 0
}

if [[ -z "${1:-}" ]]; then
    __dotfiles_usage
    return "$FAILURE"
elif [[ "$1" == "--help" || "$1" == "-h" ]]; then
    __dotfiles_usage
    return "$SUCCESS"
else
    case "$1" in
        install)
            __dotfiles_install
            ;;
        brew)
            __dotfiles_brew
            ;;
        clean)
            __dotfiles_clean
            ;;
        config)
            __dotfiles_config
            ;;
        *)
            __dotfiles_usage
            ;;
    esac
fi
