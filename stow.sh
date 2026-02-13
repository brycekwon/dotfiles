#!/usr/bin/env sh

# Dotfiles Installation Script
#
# Usage:
#   ./stow.sh [-b | -f]
#
# Options:
#   -b    Backup mode: backs up existing files before creating symlinks
#   -f    Force mode: overwrites existing symlinks without prompting
#   (none) Interactive mode: prompts before overwriting existing files
#
# This script creates symlinks from your home directory to dotfiles stored
# in the 'home/' directory relative to this script. Files named 'dot-foo'
# will be symlinked as '.foo' in your home directory.
#
# Files listed in .stow-ignore (one per line, using source names) will be
# skipped during installation. Directory patterns will skip entire directories.
#
# Example structure:
#   home/dot-bashrc     => ~/.bashrc
#   home/dot-vimrc      => ~/.vimrc
#   home/.config/foo    => (skipped, hidden files are ignored)

# check if running as root, this should NOT be done
if [ "$(id -u)" -eq 0 ]; then
  printf "Error: this program should not be ran with root privileges.\n" >&2
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

# default to backup if both flags are provided (better safe than sorry)
if [ "$backup" -eq 1 ] && [ "$force" -eq 1 ]; then
  printf "Warning: The '-b' (backup) and '-f' (force) flags are mutually exclusive.\n" >&2
  printf "Proceeding with backup priority; the force flag will be ignored.\n" >&2
  force=0
fi

# script directory
readonly SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# dotfiles source will be in the 'home/' directory relative to this script
readonly DOT_SRC="${SCRIPT_DIR}/home"
if [ -z "$DOT_SRC" ] || [ ! -d "$DOT_SRC" ]; then
  printf "Error: '%s' is not a readable directory.\n" "$DOT_SRC" >&2
  exit 1
fi

# dotfiles destination will be the value of $HOME, which is typically the home
# directory of the current user.
readonly DOT_DST="$HOME"
if [ -z "$DOT_DST" ] || [ ! -d "$DOT_DST" ] || [ ! -w "$DOT_DST" ]; then
  printf "Error: '%s' is not a writeable directory.\n" "$DOT_DST" >&2
  exit 1
fi

# load ignore patterns from .stow-ignore if it exists
readonly IGNORE_FILE="${SCRIPT_DIR}/.stow-ignore"
ignore_patterns=""
if [ -f "$IGNORE_FILE" ]; then
  ignore_patterns=$(grep -v '^#' "$IGNORE_FILE" | grep -v '^[[:space:]]*$')
fi

# function to check if a file should be ignored
should_ignore() {
  local rel_path="$1"

  if [ -z "$ignore_patterns" ]; then
    return 1
  fi

  while IFS= read -r pattern; do
    # exact match
    if [ "$rel_path" = "$pattern" ]; then
      return 0
    fi
    # check if file is under ignored directory
    case "$rel_path" in
      "$pattern"/*)
        return 0
        ;;
    esac
  done <<EOF
$ignore_patterns
EOF

  return 1
}

# layout of the source should mimic that of the target. hidden files (files
# prefixed with '.') are skipped.
readonly SCRIPT_RUN_TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)

# create a temporary file list to avoid subshell exit issues
tmpfile=$(mktemp)
trap 'rm -f "$tmpfile"' EXIT

find "$DOT_SRC" -type f ! -name '.*' -print0 > "$tmpfile"

# read from temporary file
while IFS= read -r -d '' src; do
  rel_path="${src#"$DOT_SRC"/}"

  # check if this file should be ignored
  if should_ignore "$rel_path"; then
    printf "Ignored: %s\n" "$rel_path"
    continue
  fi

  dst="${DOT_DST}/$(printf '%s\n' "$rel_path" | sed 's/^dot-/\./')"

  mkdir -p "$(dirname "$dst")" || exit 1

  if [ "$backup" -eq 1 ]; then
    if [ -f "$dst" ] || [ -L "$dst" ]; then
      backup_name="${dst}.backup.${SCRIPT_RUN_TIMESTAMP}"
      if mv "$dst" "$backup_name"; then
        printf "Backed up '%s' to '%s'\n" "$dst" "$backup_name"
      else
        printf "Error: failed to backup '%s'\n" "$dst" >&2
        exit 1
      fi
    fi
    if ! ln -sn "$src" "$dst"; then
      printf "Error: failed to create symlink '%s'\n" "$dst" >&2
      exit 1
    fi
    printf "Linked: %s => %s\n" "$src" "$dst"
  elif [ "$force" -eq 1 ]; then
    if ! ln -snf "$src" "$dst"; then
      printf "Error: failed to create symlink '%s'\n" "$dst" >&2
      exit 1
    fi
    printf "Linked: %s => %s\n" "$src" "$dst"
  else
    if ! ln -sni "$src" "$dst" < /dev/tty; then
      printf "\nSkipped: '%s'\n" "$dst"
    else
      printf "Linked: %s => %s\n" "$src" "$dst"
    fi
  fi
done < "$tmpfile"

printf "Dotfile installation complete.\n"
