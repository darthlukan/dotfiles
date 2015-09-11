#!/bin/bash

# Because this doesn't always get loaded properly
xrdb -merge $HOME/.Xresources

# GUI Vars only!
export DE=i3

# Engage
exec i3
