#!/bin/sh
printSection "Desktop"
printProgress "Installing dependencies"
carbonInstall openbox obmenu-generator awesome-git polybar rofi-git plank compton-tryone-git lightdm-webkit-theme-aether nitrogen
printProgress "Restoring Configuration"
carbonLink $CARBON_INSTALLATION_DIRECTORY/dots/openbox $CARBON_INSTALLATION_DIRECTORY/.config/openbox
carbonLink $CARBON_INSTALLATION_DIRECTORY/dots/awesome $CARBON_INSTALLATION_DIRECTORY/.config/awesome
carbonLink $CARBON_INSTALLATION_DIRECTORY/dots/compton.conf $CARBON_INSTALLATION_DIRECTORY/.config/compton.conf
carbonLink $CARBON_INSTALLATION_DIRECTORY/dots/polybar $CARBON_INSTALLATION_DIRECTORY/.config/polybar
carbonLink $CARBON_INSTALLATION_DIRECTORY/dots/rofi $CARBON_INSTALLATION_DIRECTORY/.config/rofi
carbonLink $CARBON_INSTALLATION_DIRECTORY/dots/plank $CARBON_INSTALLATION_DIRECTORY/.config/plank
carbonLink $CARBON_INSTALLATION_DIRECTORY/dots/themes/carbon $CARBON_INSTALLATION_DIRECTORY/.themes/carbon
cp $CARBON_INSTALLATION_DIRECTORY/dots/fonts/* $CARBON_INSTALLATION_DIRECTORY/.fonts/
fc-cache
