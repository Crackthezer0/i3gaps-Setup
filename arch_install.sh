#!/bin/bash

source_building(){
	#Get everything needed for the installation
	echo "Installing installation tools"
	sudo pacman --noconfirm --needed -S base-devel git stow && git clone https://aur.archlinux.org/yay.git
	cd yay && makepkg -si
	cd ..
}

install_packages(){
	#Install needed packages and do AUR stuff
	echo "Installing Packages"

	while IFS=, read -r type package description; do
		if [[ $type == "A" ]]; then
			yay --noconfirm --needed -S "$package"
		elif [[ $type == "G" ]]; then
			continue
		else
			sudo pacman --noconfirm --needed -S "$package"
		fi
	done < progs.csv
}

vm_tools(){
	#Tools for running xorg in VirtualBox
	echo "Getting VM tools:"
	sudo pacman --noconfirm --needed -S virtualbox-guest-utils && \
		sudo systemctl enable vboxservice.service && \
		sudo systemctl start vboxservice.service && \
		VBoxClient-all
}

#Dotfiles must be installed in order for xorg to launch correctly
#This is probably because the repo provides .xinitrc .Xresources
post_install_config(){
	#Stow dotfiles
	echo "Starting post configuration:"
	#Remove conflicting dot files
	rm ~/.bash*
	stow dotfiles

	#Install Oh My ZSH
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

while getopts "v" o; do
	case $o in
		v) vm_tools ;;
	esac
done

source_building

install_packages

post_install_config
