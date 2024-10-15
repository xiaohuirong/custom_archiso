#!/bin/bash
name=$HOME/Pictures/$(date '+%F_%T').png

if [ "$1" == "-f" ]; then
    wf-info | grep "Output Name:" | awk '{print $3}' | xargs -I {} grim -o {} ${name}
    wl-copy < ${name}
elif [ "$1" == "-s" ]; then
    slurp -w 0 -b "#66BB6A50" -d | grim -g - ${name}
    wl-copy < ${name}
elif [ "$1" == "-w" ]; then
    wf-info | grep "Absolute Geometry:" | awk '{print $3 " " $4}' | xargs -I {} grim -g {} ${name}
    wl-copy < ${name}
fi
