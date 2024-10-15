#!/bin/bash

#program=wlsunset
#cmd=wlsunset
program=gammastep
cmd="gammastep -O 4000"

update-info() {
    if pgrep -x "$program" > /dev/null; then
        alt=on
        tooltip="wlsunset on"
    else
        alt=off
        tooltip="wlsunset off"
    fi
    jq --unbuffered --compact-output \
        --arg alt "$alt" \
        --arg tooltip "$tooltip" \
        -n "{alt: \$alt, tooltip: \$tooltip}"
}

toggle() {
    if pgrep -x "$program" > /dev/null; then
        pkill $program
        pkill -RTMIN+10 waybar
    else
        exec $cmd & pkill -RTMIN+10 waybar
    fi
}

if [ "$1" == "--update-info" ]; then
    update-info "$@"
elif [ "$1" == "--toggle" ]; then
    toggle "$@"
fi
