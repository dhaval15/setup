#!/bin/sh
echo "$CARBON_INSTALLATION_DIRECTORY"
printSection "Shell"
printProgress "Installing dependencies"
carbonInstall zsh zsh-completions
printProgress "Cloning scripts"
carbonClone https://github.com/dhaval15/scripts.git $CARBON_INSTALLATION_DIRECTORY/scripts
printProgress "Setting up ohmyzsh"
# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
printProgress "Restoring zsh configuration"
carbonLink $CARBON_INSTALLATION_DIRECTORY/dots/.zshrc $CARBON_INSTALLATION_DIRECTORY/.zshrc
