#!/usr/bin/env sh

# check if running as root (UID=0): this should NOT be done
if [ "$(id -u)" -eq 0 ]; then
    printf "Error: this program should not be run with root privileges.\n" >&2
    exit 1
fi

# simple flagging system
force=0
backup=0
while getopts ":bf" flag; do
    case "$flag" in
        b)
            backup=1
            ;;
        f)
            force=1
            ;;
        \?)
            printf "Error: Invalid option '-%s'.\n" "$OPTARG" >&2
            exit 1
            ;;
    esac
done
shift "$((OPTIND-1))"

# default to backup if both flags are provided
if [ "$backup" -eq 1 ] && [ "$force" -eq 1 ]; then
    printf "Warning: The '-b' (backup) and '-f' (force) flags are mutually exclusive.\n" >&2
    printf "Proceeding with backup priority; the force flag will be ignored.\n" >&2
    force=0
fi

# by default, the dotfiles source will be in the 'home/' directory relative to
# this script.
readonly DOT_SRC="$(cd $(dirname "$0") && pwd)/home"
if [ -z "$DOT_SRC" ] || [ ! -d "$DOT_SRC" ]; then
    printf "Error: '%s' is not a readable directory.\n" "$DOT_SRC"
    exit 1
fi

# by default, the dotfiles destination will be the value of $HOME, which is
# typically the home directory of the current user.
readonly DOT_DST="$HOME"
if [ -z "$DOT_DST" ] || [ ! -d "$DOT_DST" ] || [ ! -w "$DOT_DST" ]; then
    printf "Error: '%s' is not a writeable directory.\n" "$DOT_DST"
    exit 1
fi

# the layout of the source should mimic that of the target. hidden files (files
# prefixed with '.') are skipped.
readonly SCRIPT_RUN_TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
find "$DOT_SRC" -type f -print0 | while IFS= read -r -d $'\0' src; do
    case "${src##*/}" in
        .*) continue ;;
    esac

    dst="${DOT_DST}/$(printf '%s\n' "${src#"$DOT_SRC"/}" | sed 's/dot-/./g')"
    printf '%s => %s\n' "$src" "$dst"

    mkdir -p "$(dirname "$dst")"
    if [ "$backup" -eq 1 ]; then
        if [ -f "$dst" ] || [ -L "$dst" ]; then
            backup_name="${dst}.backup.${SCRIPT_RUN_TIMESTAMP}"
            mv "$dst" "$backup_name" || exit 1
            printf "Backed up '%s' to '%s'\n" "$dst" "$backup_name"
        fi
        ln -sn "$src" "$dst" || exit 1
    elif [ "$force" -eq 1 ]; then
        ln -snf "$src" "$dst" || exit 1
    else
        ln -sni "$src" "$dst" < /dev/tty
        printf "\n"
    fi
done
