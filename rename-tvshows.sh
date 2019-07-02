#!/bin/bash
# TV Show Rename Script ver 1.0
#
# Purpose: rename tv show files from the dotted notation
#          commonly encountered on the internet into a 
#          more readable format
#
# Usage: <scriptname> [FILE(S)]
# 
# Example: ./rename-tvshows.sh *.mp4
#   would rename something like
#     "TV.Show.s03E4.1080p.WEB.x264.mp4"
#   into
#     "TV Show s03e04 1080p.mp4"


# QoL stuff
dimon="\E[2m"
dimoff="\E[22m"
redon="\E[31m"
redoff="\E[39m"

shopt -s extglob	# turn on extended globbing

declare -a extarr=(".mkv" ".avi" ".mp4" ".srt")

# for original in ?(*.mkv|*.avi|*.mp4|*.srt)
for original in "$@"
do
	if [[ -f $original ]];
	then
		nfile=$original
		ext=
		episode=
		newname=
		for e in "${extarr[@]}"
		do
			if [[ $nfile == *"$e" ]]; then
				ext="$e"
				newname=$(echo $nfile | sed -e "s/$e//")
			fi
		done
		
		# extract resolution
		reso=$(echo $newname | grep -Eo "(480p|720p|1080p)")
		newname=$(echo $newname | sed -e "s/\(480p\|720p\|1080p\)//g")
		
		# extract episode
		episode=$(echo $newname | grep -Eio "s[[:digit:]]{2}e[[:digit:]]{2}" | awk '{print tolower($0)}')

		# delete anything inside and including square brackets
		newname=$(echo $newname | sed -e "s/\[[^][]*\]//g")

		# delete all the text starting with the episode
		newname=$(echo $newname | sed -e "s/\(s[0-9][0-9]e[0-9][0-9]\).*//I")
		
		# replace some characters with spaces
		newname=$(echo $newname | sed -e "s/\.\|_/ /g")

		# remove double, leading and trailing spaces
		newname=$(echo $newname | sed -e "s/  ./ /g" | sed -e "s/^ .//")

		# format substrings
		[[ -z "$episode" ]] || episode=$(echo " $episode")
		[[ -z "$reso" ]] || reso=$(echo " $reso")
		lang=		#TODO actually implement lang parsing
		
		newname=$(echo "$newname$lang$episode$reso$ext")

		# check if any changes have been made
		if [[ "$original" == "$newname" ]]
		then
			# no change
			echo -e "$redon WARNING: Skipped $original $redoff"
		else
			# change detected
			echo -e "$redon$original$redoff"
			echo -e "$dimon  Name:$newname$dimoff"
			echo -e "$dimon  Extn:$ext$dimoff"
			echo -e "$dimon  Reso:$reso$dimoff"
			echo -e "$dimon  Epis:$episode$dimoff"
			echo -e "$redon-->$newname$redoff"
			mv "$original" "$newname"
		fi
	fi
done
