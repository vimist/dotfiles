#! /bin/sh

if [[ "$1" =~ ^https?://(www\.)?youtu\.?be(\.|/) ]] ||
	[[ "${1%\?*}" =~ \.(mp3|ogg|wav)$ ]]
then
	mpv "$1"
elif [[ "${1%\?*}" =~ \.(jpg|jpeg|png|bmp|tif|tiff|gif|gif)$ ]]; then
	feh "$1"
else
	$BROWSER "$1"
fi
