#!/bin/bash

if [ "$1" = "chrome" ]
then
	if [ $# -eq 2 ]
	then
		open -a "Google Chrome" http://localhost:$2
	else
		open -a "Google Chrome"
	fi
elif [ "$1" = "safari" ]
then
	if [ $# -eq 2 ]
	then
		open -a "Safari" http://localhost:$2
	else
		open -a "Safari"
	fi
elif [ "$1" = "pixel" ]
then
	~/Library/Android/sdk/emulator/emulator -avd Pixel_3_XL_API_R
elif [ "$1" = "studio" ]
then
	open -a "Android Studio"
elif [ "$1" = "fox" ]
then
	if [ $# -eq 2 ]
	then
		open -a "Firefox" http://localhost:$2
	else
		open -a "Firefox"
	fi
elif [ "$1" = "xd" ]
then
	open -a "Adobe XD"
elif [ "$1" = "postman" ]
then 
	open -a "Postman"
elif [ "$1" = "tm" ]
then
	telegramfolder=$(find ~/Library/Group\ Containers -type d -maxdepth 1 -name "*.keepcoder.Telegram")
	telegramaccountfolder=$(find "${telegramfolder}" -type d -maxdepth 1 -name "account-*")
	open "${telegramaccountfolder}/postbox/media"
elif [ "$1" = "gram" ]
then
	open -a "Telegram"
elif [ "$1" = "note" ]
then
	open -a "Notes"
elif [ "$1" = "cale" ]
then
	open -a "Calendar"
elif [ "$1" = "calc" ]
then
	open -a "Calculator"
elif [ "$1" = "music" ]
then
	open -a "Spotify"
elif [ "$1" = "server" ]
then
	python3 -m http.server
elif [ "$1" = "vlc" ]
then
	open -a "VLC"
elif [ "$1" = "." ]
then
	open .
elif [ "$1" = "github" ]
then
	open -a "Safari" https://github.com/shaheemMPM
elif [ "$1" = "fb" ]
then
	open -a "Safari" https://www.facebook.com/shaheem
elif [ "$1" = "twitter" ]
then
	open -a "Safari" https://twitter.com/shaheemMPM
elif [ "$1" = "insta" ]
then
	open -a "Safari" https://www.instagram.com
elif [ "$1" = "linked" ]
then
	open -a "Safari" https://www.linkedin.com/in/shaheemmpm
elif [ "$1" = "photos" ]
then
	open -a "Safari" https://photos.google.com
elif [ "$1" = "youtube" ]
then
	open -a "Safari" https://www.youtube.com
elif [ "$1" = "firebase" ]
then
	open -a "Safari" https://console.firebase.google.com
elif [ "$1" = "whatsapp" ]
then
	open -a "Safari" https://web.whatsapp.com
elif [ "$1" = "jump" ]
then
	if [ "$2" = "active" ]
	then
		cd ~/Desktop/Quick/_Projects/ACTIVE
		exec zsh
	else
		cd
		exec zsh
	fi
else
	echo "No Application in Name : " $1
fi

	
