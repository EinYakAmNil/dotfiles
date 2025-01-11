#!/bin/bash
[[ -z $(ls ./sync.sh) ]] && echo "Please run this script in the directory of the repository." && exit 1

echo "Installing AUR helper"
sudo pacman -S git base-devel
[[ -z $(ls yay) ]] && git clone https://aur.archlinux.org/yay.git
makepkg -siD yay

echo "Installing packages"
yay -S - < ./packages

echo "Create directories for system level configuration."
find ./system/ -mindepth 1 -type d -printf '/%P\n' | while read dir
do
	sudo mkdir -pv $dir
done

echo "Linking system config files."
find ./system/ -mindepth 1 -type f -printf '%P\n' | while read file
do
	sudo chown -R root:root ./system
	sudo ln -fbv --suffix=".old" "$PWD/system/$file" "/$file"
done

echo "Create directories for user level configuration."
find ./user/ -mindepth 1 -type d -printf "$HOME/%P\n" | while read dir
do
	mkdir -pv $dir
done

echo "Linking user config files."
find ./user/ -mindepth 1 -type f -printf '%P\n' | while read file
do
	ln -fbv --suffix=".old" "$PWD/user/$file" "$HOME/$file"
done
