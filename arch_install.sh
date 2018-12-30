#!/bin/bash

source_building(){
    #Get everything needed for the installation
    echo "Installing installation tools"
    sudo pacman --noconfirm --needed -S base-devel git stow && git clone https://aur.archlinux.org/yay.git
    cd yay && makepkg -si
}

install_packages(){
    #Install needed packages and do AUR stuff
    echo "Installing Packages"
    programs=~/dotfiles/i3gaps-Setup/progs.csv
    
    while IFS=, read -r type package description; do
	if [[ $type == "A" ]]; then
	    yay --noconfirm --needed -S "$package"
	elif [[ $type == "G" ]]; then
	    continue
	else
	    sudo pacman --noconfirm --needed -S "$package"
	fi
    done < "$programs"
}

vm_tools(){
    #Tools for running xorg in VirtualBox
    echo "Getting VM tools:"
    sudo pacman --noconfirm --needed -S virtualbox-guest-utils && \
	sudo systemctl enable vboxservice.service && \
	sudo systemctl start vboxservice.service && \
	VBoxClient-all

post_install_config(){
    #Change shell and stow dotfiles
    echo "Starting post configuration:"
    nwshell=which zsh
    chsh -s "$nwshell"
    stow ~/dotfiles/i3gaps-Setup
}

while getopts "v" o; do
    case $o in
	v) vm_tools
    esac
done

source_building

install_packages

post_install_config

