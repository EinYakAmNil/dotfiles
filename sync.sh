#!/bin/bash
[[ -z $(ls ./sync.sh) ]] && echo "Please run this script in the directory of the repository." && exit 1

if ! which yay &>/dev/null; then
	echo "Installing AUR helper"
	sudo pacman -S --needed git base-devel
	cd /tmp
	git clone https://aur.archlinux.org/yay.git
	makepkg -siD yay
fi

echo "Installing packages"
yay -S --needed - <./packages

echo "Create directories for system level configuration"
find ./system/ -mindepth 1 -type d -printf '/%P\n' | while read dir; do
	sudo mkdir -pv $dir
done

echo "Linking system config files"
find ./system/ -mindepth 1 -type f -printf '%P\n' | while read file; do
	sudo chown -R root:root ./system
	sudo ln -fbv --suffix=".old" "$PWD/system/$file" "/$file"
done

echo "Create directories for user level configuration"
find ./user/ -mindepth 1 -type d -printf "$HOME/%P\n" | while read dir; do
	mkdir -pv $dir
done

echo "Linking user config files"
find ./user/ -mindepth 1 -type f -printf '%P\n' | while read file; do
	ln -fbv --suffix=".old" "$PWD/user/$file" "$HOME/$file"
done

echo "Setting up awesome wm config"
mkdir -pv $HOME/Projekte
cd $HOME/Projekte
git clone https://github.com/EinYakAmNil/Awesome-Yak.git awesome
ln -sfbvT --suffix=".old" "$PWD/awesome" "$HOME/.config/awesome"

echo "Setting up neovim config"
git clone https://github.com/EinYakAmNil/nvim-config.git
ln -sfbvT --suffix=".old" "$PWD/nvim-config" "$HOME/.config/nvim"

echo "Adding mpv sponsorblock"
mkdir -pv $HOME/Repositorien
cd $HOME/Repositorien
ls mpv_sponsorblock || git clone https://github.com/po5/mpv_sponsorblock.git
cd mpv_sponsorblock
ln -sfbvT --suffix=".old" "$PWD/sponsorblock.lua" "$HOME/.config/mpv/scripts/sponsorblock.lua"
ln -sfbvT --suffix=".old" "$PWD/sponsorblock_shared" "$HOME/.config/mpv/scripts/sponsorblock_shared"
