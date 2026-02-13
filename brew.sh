#!/usr/bin/env sh

# Homebrew Installation Script
#
# Checks if Homebrew is installed and installs it if not present.
# If Homebrew was just installed, runs brew bundle with Brewfile in the same directory.

# check if running as root, this should NOT be done
if [ "$(id -u)" -eq 0 ]; then
  printf "Error: this script should not be run with root privileges.\n" >&2
  exit 1
fi

# script directory
readonly SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
readonly BREWFILE="${SCRIPT_DIR}/Brewfile"

# check if homebrew is already installed
if command -v brew >/dev/null 2>&1; then
  printf "Homebrew is already installed at: %s\n" "$(command -v brew)"
  printf "Version: %s\n" "$(brew --version | head -n 1)"
  exit 0
fi

printf "Homebrew not found. Installing...\n"

# download and run the official homebrew installer
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# check if installation succeeded
if ! command -v brew >/dev/null 2>&1; then
  printf "Error: Homebrew installation failed.\n" >&2
  exit 1
fi

printf "Homebrew installed successfully!\n"
printf "Version: %s\n" "$(brew --version | head -n 1)"

# install from Brewfile if it exists
if [ -f "$BREWFILE" ]; then
  printf "\nInstalling packages from Brewfile...\n"
  brew bundle --file="$BREWFILE"
else
  printf "\nWarning: Brewfile not found at '%s'\n" "$BREWFILE"
fi
