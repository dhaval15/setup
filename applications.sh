#!/bin/sh
printSection "Applications"
printProgress "Installing dependencies"
carbonInstall ranger qutebrowser alacritty typora mpv nemo zathura zathura-pdf-mupdf lxtask chromium fzf exa bat gpick kitty ripgrep sxiv
printProgress "Restoring Configuration"
carbonLink $CARBON_INSTALLATION_DIRECTORY/dots/alacritty $CARBON_INSTALLATION_DIRECTORY/.config/alacritty
carbonLink $CARBON_INSTALLATION_DIRECTORY/dots/kitty $CARBON_INSTALLATION_DIRECTORY/.config/kitty
carbonLink $CARBON_INSTALLATION_DIRECTORY/dots/ranger $CARBON_INSTALLATION_DIRECTORY/.config/ranger
carbonLink $CARBON_INSTALLATION_DIRECTORY/dots/qutebrowser $CARBON_INSTALLATION_DIRECTORY/.config/qutebrowser
carbonLink $CARBON_INSTALLATION_DIRECTORY/dots/zathura $CARBON_INSTALLATION_DIRECTORY/.config/zathura
carbonLink $CARBON_INSTALLATION_DIRECTORY/dots/bat $CARBON_INSTALLATION_DIRECTORY/.config/bat
carbonLink $CARBON_INSTALLATION_DIRECTORY/dots/sxiv $CARBON_INSTALLATION_DIRECTORY/.config/sxiv
