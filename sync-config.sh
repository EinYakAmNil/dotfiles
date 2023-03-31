#!/bin/sh
DIR=$(pwd)
esc_DIR=$(echo $DIR | sed 's/\//\\\//g')

# Find all config files
CONFIGS=$(find $DIR -type f -not \( -path "$DIR/\.git/*" -o -path "$DIR/git-repos" -o -path "$DIR/sync-config.sh" \))

# Create the directories to which they belong
CONFIG_DIRS=$(find $DIR -type d -not \( -path "$DIR/\.git" -o -path "$DIR/\.git/*" \) | sed "s/^$esc_DIR//" | sed "s/^\/home\/user/\/home\/xinux/")
sudo mkdir -v -p $CONFIG_DIRS

# Copy them over
for i in $CONFIGS
do
	sudo cp -iv "$i" $(echo $i | sed "s/^$esc_DIR//" | sed "s/^\/home\/user/\/home\/xinux/")
done

# Set correct permissions for user configs
sudo chown -R $USER:$USER /home/$USER
