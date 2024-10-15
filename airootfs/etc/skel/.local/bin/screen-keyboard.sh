#!/bin/bash

update-info() {
    if [[ ! `pidof wvkbd-mobintl` ]]; then
        alt=off
        tooltip="Screen keyboard off"
    else
        alt=on
        tooltip="Screen keyboard on"
    fi
    jq --unbuffered --compact-output \
        --arg alt "$alt" \
        --arg tooltip "$tooltip" \
        -n "{alt: \$alt, tooltip: \$tooltip}"
}

run() {
    if [[ ! `pidof wvkbd-mobintl` ]]; then
        exec wvkbd-mobintl -L 300 --fn "DejaVuSansM Nerd Font Mono 20" --alpha 150 --text f06191 --text-sp 2278ea --fg 545C7E --fg-sp 24283B --bg 000000 & pkill -RTMIN+9 waybar
    else
        pkill wvkbd-mobintl 
        pkill -RTMIN+9 waybar
    fi
}

if [ "$1" == "--update-info" ]; then
    update-info "$@"
elif [ "$1" == "--run" ]; then
    run "$@"
fi
