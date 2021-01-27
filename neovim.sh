#!/bin/sh
printSection "Neovim"
printProgress "Installing dependencies"
carbonInstall neovim nodejs fzf ripgrep
printProgress "Restoring Configuration"
carbonClone https://github.com/dhaval15/nvim.git $CARBON_INSTALLATION_SCRIPT/.config/nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
