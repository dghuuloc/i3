#!/bin/bash
shopt -s nullglob

if [[ -z $(which feh) ]]
then
    echo "wallpaper err: Can not found command feh." > ~/i3wm-wallpaper.err
    exit 127
fi

#===change these config start===

#wallpapers directory
path=/home/asusarch/.config/i3/wallpapers

#time interval
interval=15m

#===change these config end===

cd $path

while true
do
	files=()
	for i in *.jpg *.png; do
		[[ -f $i ]] && files+=("$i")
	done
	range=${#files[@]}

	((range)) && feh --bg-scale "${files[RANDOM % range]}"

	sleep $interval
done
