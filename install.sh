#!/bin/bash
XAMPP=/opt/lampp
DEST=/usr/bin/xampp

if ! [[ -d "$XAMPP" ]]; then

	# Upstream 
	MAJOR="8.0.6" && PATCH="0" && XAMPPVERSION='"$MAJOR"-"$PATCH"'
	URL='https://www.apachefriends.org/xampp-files/"$MAJOR"/xampp-linux-x64-"$XAMPPVERSION"-installer.run'
	
	if ! [[ $(which wget) ]]; then
		sudo apt update && sudo apt install -y wget
	fi

	if ! [[ -f 'xampp-linux-x64-"$XAMPPVERSION"-installer.run' ]]; then
		wget -O 'xampp-linux-x64-"$XAMPPVERSION"-installer.run' "$URL"	
	fi

	chmod 755 xampp-linux-*-installer.run && sudo ./xampp-linux-*-installer.run

fi

sudo cp "xampp" "$DEST" && sudo chmod 0755 "$DEST"