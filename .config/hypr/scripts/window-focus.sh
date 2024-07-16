#!/bin/zsh
# Script by secretpocketcat https://www.reddit.com/r/hyprland/comments/1ang7ja/focusing_a_window_with_rofi/

if [ $argv[1] ]; then 
    # switch focus
    hyprctl dispatch focuswindow address:$ROFI_INFO >/dev/null &
else
    # prase valid windows into options for rofi
    hyprctl clients -j | jq -r '.[] | select(.pid != -1) | "  \(.class) \(.title)\u0000info\u001f\(.address)\u001ficon\u001f\(.class | ascii_downcase)"'
fi
