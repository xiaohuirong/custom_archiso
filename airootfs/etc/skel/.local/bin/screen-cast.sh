#!/bin/bash

update-info() {
    if [[ ! `pidof wl-screenrec` ]]; then
        alt=off
        tooltip=$(cat <<EOF
Screen Cast off
left:   select window
right:  select region
middle: full screen
EOF
)

    else
        alt=on
        tooltip=$(cat <<EOF
Screen Cast on
left/right/middle:  stop recording
EOF
)
    fi

    jq --unbuffered --compact-output \
        --arg alt "$alt" \
        --arg tooltip "$tooltip" \
        -n "{alt: \$alt, tooltip: \$tooltip, class: \$alt}"
}

toggle() {
    if [[ ! `pidof wl-screenrec` ]]; then
        name=$HOME/Videos/$(date '+%F_%T').mp4
        #device="--dri-device=/dev/dri/by-name/rx580-render"
        #device="--dri-device=/dev/dri/renderD128"
        device=""
        option="--low-power=off"
        if [ "$2" == "--select" ]; then
            region=$(slurp -w 0 -b "#66BB6A50" -d)
            exec wl-screenrec -g "$region" --codec hevc $device $option -f $name & pkill -RTMIN+11 waybar
        elif [ "$2" == "--window" ]; then
            region=$(wf-info | grep "Absolute Geometry:" | awk '{print $3 " " $4}')
            exec wl-screenrec -g "$region" --codec hevc $device $option -f $name & pkill -RTMIN+11 waybar
        else
            output=$(wf-info | grep "Output Name:" | awk '{print $3}')
            exec wl-screenrec -o "$output" --codec hevc $device $option -f $name & pkill -RTMIN+11 waybar
        fi
    else
        pkill wl-screenrec 
        while [[ `pidof wl-screenrec` ]]; do
            pkill wl-screenrec 
            sleep 0.01
        done
        pkill -RTMIN+11 waybar
    fi
}

if [ "$1" == "--update-info" ]; then
    update-info "$@"
elif [ "$1" == "--toggle" ]; then
    toggle "$@"
fi
