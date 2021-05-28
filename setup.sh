#!/bin/bash
XAMPP=/opt/lampp
DEST=/usr/bin/xampp

if [[ $1 == 'install' ]]; then

	if ! [[ -d "$XAMPP" ]]; then

		# Upstream 
		URL='https://www.apachefriends.org/xampp-files/8.0.6/xampp-linux-x64-8.0.6-0-installer.run'
	
		if ! [[ $(which wget) ]]; then
			sudo apt update && sudo apt install -y wget
		fi

		if ! [[ $(which netstat) ]]; then
			sudo apt update && sudo apt install -y net-tools	
		fi

		if ! [[ -f 'xampp-linux-*-installer.run' ]]; then
			wget --no-clobber "$URL"
		fi

		chmod 755 xampp-linux-*-installer.run && sudo ./xampp-linux-*-installer.run

		sudo cp "xampp" "$DEST" && sudo chmod 0755 "$DEST"

	fi

elif [[ $1 == 'uninstall' ]]; then

	sudo $XAMPP/uninstall && sudo rm -rf "$XAMPP"

else

	printf "Too few or invalid argument!"

fi
