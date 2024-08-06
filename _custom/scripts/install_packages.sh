#!/bin/bash

packages=(
    bat
    btop
    cargo
    colima
    corepack_20
    coreutils
    curl
    docker
    docker-compose
    exiftool
    eza
    fd
    ffmpeg
    fzf
    gawk
    gcc
    git
    gnupg
    gnused
    gnutar
    go
    hugo
    jq
    neovim
    nodejs_20
    p7zip
    pinentry-tty
    python311Full
    python311Packages.pip
    ripgrep
    rustc
    stow
    temurin-bin
    tmux
    tokei
    vim
    wget
    yt-dlp
    zoxide
)

for pkg in "${packages[@]}"; do
    nix-env -iA nixpkgs."$pkg"
done
