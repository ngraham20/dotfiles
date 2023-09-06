#!/bin/bash

game-mode() {
  xinput set-prop 10 'libinput Disable While Typing Enabled' 0
}

typing-mode() {
  xinput set-prop 10 'libinput Disable While Typing Enabled' 1
}

case $1 in
  "gaming")
    game-mode;
    ;;
  "typing")
    typing-mode;
    ;;
esac
