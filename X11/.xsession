#!/bin/bash

xss-lock -- betterlockscreen -l &
picom & disown
wal -R
# wal --backend colorthief -i ~/Pictures/Wallpapers/anime-girl-city.webp
eww daemon
eww open bar
$HOME/.config/eww/current/scripts/powerprofiles get &
pcloud &
#polybar & disown
#nm-applet & disown
#eww open leftbar
#eww open rightbar
export PATH=$PATH:~/.local/bin
