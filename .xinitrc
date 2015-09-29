#!/bin/bash

# Because this doesn't always get loaded properly
xrdb -merge $HOME/.Xresources

# Because keybinds are useful!
# sxhkd -c $HOME/.sxhkdrc >/dev/null 2>&1 &

# Because I like my background just fine
# exec $HOME/.fehbg

# GUI Vars only!
export DE=i3

# Engage
exec i3
