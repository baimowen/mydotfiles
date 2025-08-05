#!/usr/bin/bash
~/.config/waybar/scripts/island/island.py &
while true
do
    # echo ""
    out=$(cat ~/.config/waybar/scripts/island/store/dynamic_out.txt)
    echo "$out"
    sleep 0.5
done
