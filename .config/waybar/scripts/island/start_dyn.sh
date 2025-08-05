#!/usr/bin/bash
~/.config/waybar/scripts/island/dynamic.py &
while true
do
    # echo ""
    out=$(cat ~/.config/waybar/scripts/island/dynamic.py)
    echo "$out"  | jq --unbuffered --compact-output
    # cat ~/.config/hypr/scripts/tools/dynamic_out.txt
    sleep 0.5
done
