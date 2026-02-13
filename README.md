# Dotfiles

Configuration files and scripts for my macOS environment.

## Scripts

- `stow.sh` - Symlinks files from `home/` to `$HOME`. Flags: `-b` (backup), `-f` (force)
- `brew.sh` - Installs Homebrew and runs Brewfile (only on first install)
- `macos.sh` - Applies macOS settings

Files prefixed with `dot-` become `.` files. Add patterns to `.stow-ignore` to skip files.
