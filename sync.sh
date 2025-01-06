#!/bin/bash
[[ -z $(ls ./sync.sh) ]] && echo "Please run this script in the directory of the repository." && exit 1

echo "Installing AUR helper"
sudo pacman -S git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

echo "Installing packages"
yay -S - < ./packages

echo "Create directories for system level configuration."
find ./system/ -mindepth 1 -type d -printf '/%P\n' | while read dir
do
	sudo mkdir -pv $dir
done

echo "Create directories for user level configuration."
find ./user/ -mindepth 1 -type d -printf "$HOME/%P\n" | while read dir
do
	mkdir -pv $dir
done
