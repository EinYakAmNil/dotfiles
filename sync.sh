#!/bin/bash
ls ./sync-config.sh || echo "Please run this script in the directory of the repository" && exit 1

dotfiles_dir=$PWD

# Download AUR helper in another directory
sudo pacman -S git base-devel
mkdir -pv $HOME/Repositorien
cd $HOME/Repositorien
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Return to dofiles directory and proceed with configuration
cd $dotfiles_dir

yay -S - < ./packages

# Create directories for system level configuration
find ./system/ -mindepth 1 -type d -printf '/%P\n' | while read dir
do
	sudo mkdir -pv $dir
done

# Create directories for user level configuration
find ./user/ -mindepth 1 -type d -printf "$HOME/%P\n" | while read dir
do
	mkdir -pv $dir
done
