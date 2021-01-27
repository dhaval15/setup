#!/bin/sh
printSection "Neovim"
printProgress "Installing dependencies"
carbonInstall neovim nodejs fzf ripgrep
printProgress "Restoring Configuration"
carbonLink $CARBON_INSTALLATION_DIRECTORY/dots/nvim $CARBON_INSTALLATION_DIRECTORY/.config/nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
