#!/bin/bash
XAMPP=/opt/lampp
DEST=/usr/bin/xampp

if ! [[ -d "$XAMPP" ]]; then

	# Upstream 
	URL='https://www.apachefriends.org/xampp-files/8.0.6/xampp-linux-x64-8.0.6-0-installer.run'
	
	if ! [[ $(which wget) ]]; then
		sudo apt update && sudo apt install -y wget
	fi

	if ! [[ -f 'xampp-linux-*-installer.run' ]]; then
		wget --no-clobber "$URL"
	fi
	chmod 755 xampp-linux-*-installer.run && sudo ./xampp-linux-*-installer.run

fi

sudo cp "xampp" "$DEST" && sudo chmod 0755 "$DEST"