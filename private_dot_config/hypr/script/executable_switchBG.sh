#!/usr/bin/env bash

handle() {
    case $1 in
        workspacev2*)
            echo "line: $line"
            if [[ "$line" =~ ^workspacev2\>\>([[:digit:]]+),.*$ ]]; then
                CurWS="${BASH_REMATCH[1]}"
                BgName=$(( (CurWS+MONITOR_COUNT-1) / MONITOR_COUNT ))
                echo "current workspace: $CurWS, background name: $BgName"
                if [[ "$CurWS" -ne "$PreWS" ]] && [[ -f "$HOME"/Pictures/bg/bg"$BgName".png ]]; then
                    if [[ "$CurWS" -lt "$PreWS" ]]; then
                        TransitionType="left"
                    else
                        TransitionType="right"
                    fi
                    swww img --resize=no --transition-type="$TransitionType" --transition-step=4 --transition-duration=0.6 --transition-fps=60 "$HOME"/Pictures/bg/bg"$BgName".png
                    PreWS=$CurWS
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
PreWS=$(hyprctl -j activeworkspace | jq '.id')
# if [[ -f "$HOME"/Pictures/bg/bg"$CurWS".png ]]; then
#     swww img --resize=no --transition-type=center --transition-step=4 --transition-duration=3 --transition-fps=60 "$HOME"/Pictures/bg/bg"$PreWS".png
# fi
socat -U - UNIX-CONNECT:"$XDG_RUNTIME_DIR"/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock | while read -r line; do handle "$line"; done
