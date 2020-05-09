#!/bin/bash

mountpath="$HOME/mnt"
label="$(ls "$mountpath" | cut -d'/' -f3 | rofi -dmenu -p "unmount")"

[[ -z $label ]] && exit

result="$(sudo umount "$mountpath/$label" 2>&1)"
rmdir "$mountpath/$label"

[[ -z $result ]] && notify-send -u low "$label unmounted!" && exit

notify-send "$result"

