#!/bin/bash

label="$(find /dev/disk/by-label/* | cut -d'/' -f5 | sed '/^[[:space:]]*$/d; /^Recovery$/d; /^arch$/d' | rofi -dmenu -p "mount")"

[[ -z $label ]] && echo "Cancelled." && notify-send "Mount cancelled." && exit

devicepath="/dev/disk/by-label/$label"
mountpath="$HOME/mnt/$label"
exists="$(ls $mountpath 2>/dev/null)"

[[ -n $exists ]] && exit

mkdir "$mountpath"
result="$(sudo mount "$devicepath" "$mountpath" 2>&1)"

[[ -z $result ]] && notify-send -u low "$label mounted!" && exit

notify-send "$result"

