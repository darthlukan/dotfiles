#!/bin/bash
# baraction.sh for spectrwm status bar
# From http://wiki.archlinux.org/index.php/Scrotwm

SLEEP_SEC=5
#loops forever outputting a line every SLEEP_SEC secs
while :; do

    SYSINFO=$(python3 $HOME/bin/sysinfo.py)
	echo $SYSINFO

	sleep $SLEEP_SEC
done
