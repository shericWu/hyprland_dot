#!/usr/bin/env bash

MONITOR_NAME=$(hyprctl monitors -j | jq '.[].name')
MONITOR_COUNT=$(wc --lines <<< "$MONITOR_NAME")
MONITOR=()
IFS=$'\n'
read -rd '' -a MONITOR <<< "$MONITOR_NAME"

WSRULES=""
WSCREATE=""
HYPRLAND_WSCOUNT=9
for (( m=0; m<MONITOR_COUNT; m++ ));
do
    oldName=${MONITOR[m]}
    name="${oldName:1:-1}"
    id=$((m + 1))
    for (( i=1; i<=HYPRLAND_WSCOUNT; i++ ));
    do
        WSRULES+="keyword workspace $id,persistent:true,monitor:$name; "
        WSCREATE+="dispatch workspace $id; "
        id=$((id + MONITOR_COUNT))
    done
done

echo "$WSRULES $WSCREATE"
hyprctl --batch "$WSRULES$WSCREATE"

MIDDLE=$((((HYPRLAND_WSCOUNT+1) / 2 - 1) * MONITOR_COUNT))
for (( m=1; m<=MONITOR_COUNT; m++ ));
do
    echo "hyprctl dispatch workspace $ID"
    hyprctl dispatch workspace "$((m + MIDDLE))"
    sleep 0.1
    hyprctl dispatch workspace "$m"
    hyprctl dispatch workspace "$((m + MIDDLE))"
done

hyprctl dispatch workspace "$((1 + MIDDLE))"
# hyprctl dispatch workspace e~5
# sleep 0.1
# hyprctl dispatch workspace e~1
# hyprctl dispatch workspace e~5
