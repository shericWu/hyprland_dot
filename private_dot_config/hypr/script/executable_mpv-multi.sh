#!/usr/bin/env bash

# USAGE: mpv-multi <filename>
# Note that subtitles should be in same directory as video
#                     should have same prefix as video

fullname=$1
filename="${fullname%.*}"
echo "Opening '$filename'..."
filename=${filename//\[/\\\[}
filename=${filename//\]/\\\]}
fullname=${fullname//\[/\\\[}
fullname=${fullname//\]/\\\]}

subs=$(find ./ -name "$filename*" -not -name "$fullname")
count=$(echo "$subs" | wc --lines)
echo "Find $count subtitle(s)"
IFS=$'\n'
count=0
sub_param=""
for sub in $subs
do
    echo "    $sub"
    if (( count == 0 )); then
        sub_param+="${sub//$'\n'/}"
    else
        sub_param+=":${sub//$'\n'/}"
    fi;
    ((count++))
done
unset IFS
echo ""
echo "mpv --sub-files=$sub_param --secondary-sid=$count $1"
mpv --sub-files="$sub_param" --secondary-sid=$count "$1"
