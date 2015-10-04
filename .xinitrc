#!/bin/bash

# Because this doesn't always get loaded properly
xrdb -merge $HOME/.Xresources

WM=swm

case $WM in
    i3)
        export DE=i3
        exec i3
        ;;
    swm)
        # Because keybinds are useful!
        sxhkd -c $HOME/.sxhkdrc &
        # Because I like my background just fine
        sh $HOME/.fehbg &
        swm &
        exec urxvt
        ;;
    *)
        echo "ERROR! Not risking an insane config, dying..."
        ;;
esac
