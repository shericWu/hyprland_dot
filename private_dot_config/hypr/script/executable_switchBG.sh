#!/usr/bin/env bash

handle() {
    case $1 in
        workspacev2*)
            echo "$line"
            if [[ "$line" =~ ^workspacev2\>\>([[:digit:]]+),.*$ ]]; then
                CurWS="${BASH_REMATCH[1]}"
                echo "$CurWS"
                if [[ "$CurWS" -ne "$PreWS" ]] && [[ -f "$HOME"/Pictures/bg/bg"$CurWS".png ]]; then
                    if [[ "$CurWS" -lt "$PreWS" ]]; then
                        TransitionType="left"
                    else
                        TransitionType="right"
                    fi
                    swww img --resize=no --transition-type="$TransitionType" --transition-step=4 --transition-duration=0.5 --transition-fps=60 "$HOME"/Pictures/bg/bg"$CurWS".png
                    PreWS=$CurWS
                fi
            fi
            ;;
    esac
}

PreWS=$(hyprctl -j activeworkspace | jq '.id')
# if [[ -f "$HOME"/Pictures/bg/bg"$CurWS".png ]]; then
#     swww img --resize=no --transition-type=center --transition-step=4 --transition-duration=3 --transition-fps=60 "$HOME"/Pictures/bg/bg"$PreWS".png
# fi
socat -U - UNIX-CONNECT:"$XDG_RUNTIME_DIR"/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock | while read -r line; do handle "$line"; done
