#!/usr/bin/env bash

HYPRLAND_WSCOUNT=9

WSRULES=""
WSCREATE=""
for (( i=HYPRLAND_WSCOUNT; i>=1; i-- ));
do
    WSRULES+="keyword workspace $i,persistent:true; "
    WSCREATE+="dispatch workspace $i; "
done

hyprctl --batch "$WSRULES$WSCREATE"

hyprctl dispatch workspace 5
sleep 0.1
hyprctl dispatch workspace 1
hyprctl dispatch workspace 5
