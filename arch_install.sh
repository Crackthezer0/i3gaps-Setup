#!/bin/bash
source_building(){
    sudo pacman --noconfirm --needed -S base-devel git stow && git clone https://aur.archlinux.org/yay.git
    cd yay && makepkg -si
}

install_packages(){
    programs=~/dotfiles/i3gaps-Setup/progs.csv
    
    while IFS=, read -r type package description; do
	if [[ $type == "A" ]]; then
	    sudo yay --noconfirm -S "$package"
	elif [[ $type == "G" ]]; then
	    continue
	else
	    sudo pacman --noconfirm --needed -S "$package"
	fi
    done < "$programs"
}

source_building

install_packages

stow ~/dotfiles/i3gaps-Setup
