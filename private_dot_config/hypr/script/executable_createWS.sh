#!/usr/bin/env bash
# Updated for Hyprland 0.57 (Lua config):
#   - `hyprctl keyword workspace ...` no longer exists -> rules are added with `hyprctl eval 'hl.workspace_rule{...}'`
#   - `hyprctl dispatch workspace N` -> `hyprctl dispatch 'hl.dsp.focus({ workspace = "N" })'`
# The socket2 path and the `workspacev2>>ID,NAME` event format are unchanged for numbered workspaces.

handle() {
    case $1 in
        workspacev2*)
            # echo "line: $line"
            if [[ "$line" =~ ^workspacev2\>\>([[:digit:]]+),.*$ ]]; then
                CurWS="${BASH_REMATCH[1]}"
                BgName="$HOME/Pictures/bg/bg$(((CurWS+MONITOR_COUNT-1) / MONITOR_COUNT)).png"
                OutputID=$(((CurWS-1) % MONITOR_COUNT))
                OutputName=${MONITOR[$OutputID]}
                # echo "current workspace: $CurWS, background name: $BgName"
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

focus_ws() {
    hyprctl dispatch "hl.dsp.focus({ workspace = \"$1\" })" > /dev/null
}

kill "$(pgrep --full 'bash /home/sheric/.config/hypr/script/createWS.sh' | grep -v ^$$\$)"

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

# Build one Lua chunk with all the rules, then one eval (replaces the old `--batch` of keywords)
WSRULES=""
HYPRLAND_WSCOUNT=9
for (( m=0; m<MONITOR_COUNT; m++ ));
do
    id=$((m + 1))
    for (( i=1; i<=HYPRLAND_WSCOUNT; i++ ));
    do
        WSRULES+="hl.workspace_rule({ workspace = \"$id\", persistent = true, monitor = \"${MONITOR[$m]}\" })"$'\n'
        id=$((id + MONITOR_COUNT))
    done
done

# echo "$WSRULES"
hyprctl eval "$WSRULES" > /dev/null

# Persistent rules only spawn workspaces once they're visited, like the old `dispatch workspace` loop did
for (( m=0; m<MONITOR_COUNT; m++ ));
do
    id=$((m + 1))
    for (( i=1; i<=HYPRLAND_WSCOUNT; i++ ));
    do
        focus_ws "$id"
        id=$((id + MONITOR_COUNT))
    done
done

PreWS=()
MIDDLE=$((((HYPRLAND_WSCOUNT+1) / 2 - 1) * MONITOR_COUNT))
for (( m=0; m<MONITOR_COUNT; m++ ));
do
    PreWS[m]="$((m + MIDDLE + 1))"
    # echo "focus workspace ${PreWS[$m]}"
    focus_ws "${PreWS[$m]}"
    sleep 0.1
    focus_ws "$((m+1))"
    focus_ws "${PreWS[$m]}"
done

focus_ws "$((1 + MIDDLE))"

#########################
### Switch Background ###
#########################
BgName="$HOME/Pictures/bg/bg$(((MIDDLE+MONITOR_COUNT) / MONITOR_COUNT)).png"
swww img "$BgName" --transition-type=center --transition-fps=60 --transition-duration=2
socat -U - UNIX-CONNECT:"$XDG_RUNTIME_DIR"/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock | while read -r line; do handle "$line"; done
