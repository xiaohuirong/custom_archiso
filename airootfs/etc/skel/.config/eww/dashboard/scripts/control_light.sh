#!/bin/bash

# monitor=$(wayland-info | grep eDP-1)
edp=$(cat /sys/class/drm/card1-eDP-1/enabled)
dp=$(cat /sys/class/drm/card1-DP-1/enabled)

if [ "$dp" = "enabled" ]
then
    echo "DP-1"
    /home/xiao/.local/bin/monitor-control DP-1 0x10 $1

elif [ "$edp" = "enabled" ]
then
    echo "eDP-1"
    current=$(/usr/bin/light | awk '{split($1, arr, "."); print arr[1]}')
    if (("$1" > "$current")) 
    then
        echo "$1 > $current"
        val=$(("$1" - "$current"))
        echo $val
        light -A $val
    else
        echo "$1 < $current"
        val=$(("$current" - "$1"))
        echo $val
        light -U $val
    fi
fi

./sys_info --blight > /run/user/1000/light.sock

