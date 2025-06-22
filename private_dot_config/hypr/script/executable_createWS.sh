#!/usr/bin/env bash

handle() {
    case $1 in
        workspacev2*)
            echo "line: $line"
            if [[ "$line" =~ ^workspacev2\>\>([[:digit:]]+),.*$ ]]; then
                CurWS="${BASH_REMATCH[1]}"
                BgName="$HOME/Pictures/bg/bg$(((CurWS+MONITOR_COUNT-1) / MONITOR_COUNT)).png"
                OutputID=$(((CurWS-1) % MONITOR_COUNT))
                OutputName=${MONITOR[$OutputID]}
                echo "current workspace: $CurWS, background name: $BgName"
                if [[ "$CurWS" -ne "${PreWS[$OutputID]}" ]] && [[ -f "$BgName" ]]; then
                    if [[ "$CurWS" -lt "${PreWS[$OutputID]}" ]]; then
                        TransitionType="left"
                    else
                        TransitionType="right"
                    fi
                    swww img --transition-type="$TransitionType" -o "$OutputName" --transition-step=4 --transition-duration=0.6 --transition-fps=60 "$BgName"
                    # matugen image "$BgName" -m "dark"
                    PreWS[OutputID]=$CurWS
                fi
            fi
            ;;
    esac
}

MONITOR_NAME=$(hyprctl monitors -j | jq '.[].name')
MONITOR_COUNT=$(wc --lines <<< "$MONITOR_NAME")
MONITOR=()
IFS=$'\n'
read -rd '' -a MONITOR <<< "$MONITOR_NAME"
for (( m=0; m<MONITOR_COUNT; m++ ));
do
    oldName=${MONITOR[m]}
    MONITOR[m]="${oldName:1:-1}"
done

WSRULES=""
WSCREATE=""
HYPRLAND_WSCOUNT=9
for (( m=0; m<MONITOR_COUNT; m++ ));
do
    id=$((m + 1))
    for (( i=1; i<=HYPRLAND_WSCOUNT; i++ ));
    do
        WSRULES+="keyword workspace $id,persistent:true,monitor:${MONITOR[$m]}; "
        WSCREATE+="dispatch workspace $id; "
        id=$((id + MONITOR_COUNT))
    done
done

echo "$WSRULES $WSCREATE"
hyprctl --batch "$WSRULES$WSCREATE"

PreWS=()
MIDDLE=$((((HYPRLAND_WSCOUNT+1) / 2 - 1) * MONITOR_COUNT))
for (( m=0; m<MONITOR_COUNT; m++ ));
do
    PreWS[m]="$((m + MIDDLE + 1))"
    echo "hyprctl dispatch workspace ${PreWS[$m]}"
    hyprctl dispatch workspace "${PreWS[$m]}"
    sleep 0.1
    hyprctl dispatch workspace "$((m+1))"
    hyprctl dispatch workspace "${PreWS[$m]}"
done

hyprctl dispatch workspace "$((1 + MIDDLE))"

#########################
### Switch Background ###
#########################
BgName="$HOME/Pictures/bg/bg$(((MIDDLE+MONITOR_COUNT) / MONITOR_COUNT)).png"
swww img "$BgName" --transition-type=center --transition-fps=60 --transition-duration=2
socat -U - UNIX-CONNECT:"$XDG_RUNTIME_DIR"/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock | while read -r line; do handle "$line"; done
