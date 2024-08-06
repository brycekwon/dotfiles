# Bryce Kwon's Dotfiles

Series of configuration files and scripts used to setup my MacOS environment.

## Installation

This configuration uses [Nix](https://nixos.org) for package management and
[GNU Stow](https://www.gnu.org/software/stow/) for symlinking dotfiles to their appropriate
locations.

First, ensure Nix is [properly installed for macOS](https://nixos.org/download/)

```bash
sh <(curl -L https://nixos.org/nix/install)
```

Next, install the required packages using the `install_packages.sh` script located in this
repository. Inside this script is an array of packages that will be automatically run through the
`nix-env -iA nixpkgs.<PKG_NAME>` command. Update to your needs but ensure that **stow** is part of
the installed packages.

Finally, navigate to the root of this repository and run the following command to symlink the
proper configuration files to their appropriate location.

```bash
stow .
```
