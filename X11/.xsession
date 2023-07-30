#!/bin/bash

xss-lock -- betterlockscreen -l &
picom & disown
wal -R
# wal --backend colorthief -i ~/Pictures/Wallpapers/anime-girl-city.webp
eww daemon
eww open leftbar
eww open rightbar
export PATH=$PATH:~/.local/bin
