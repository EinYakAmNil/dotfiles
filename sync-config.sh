#!/bin/sh
DIR=$(pwd)
esc_DIR=$(echo $DIR | sed 's/\//\\\//g')

# Install basic packages
sudo pacman -S - < $DIR/packages

# Find all config files
CONFIGS=$(find $DIR -type f -not \( -path "$DIR/\.git/*" -o -path "$DIR/git-repos" -o -path "$DIR/sync-config.sh" -o -path "$DIR/packages" \))

# Create the directories to which they belong
CONFIG_DIRS=$(find $DIR -type d -not \( -path "$DIR/\.git" -o -path "$DIR/\.git/*" \) | sed "s/^$esc_DIR//" | sed "s/^\/home\/user/\/home\/$USER/")
sudo mkdir -v -p $CONFIG_DIRS

# Copy them over
for i in $CONFIGS
do
	sudo cp -iv "$i" $(echo $i | sed "s/^$esc_DIR//" | sed "s/^\/home\/user/\/home\/$USER/")
done

# Set correct permissions for user configs
sudo chown -R $USER:$USER /home/$USER
