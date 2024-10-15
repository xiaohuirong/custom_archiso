#!/bin/bash

# monitor=$(wayland-info | grep eDP-1)
edp=$(cat /sys/class/drm/card1-eDP-1/enabled)
dp=$(cat /sys/class/drm/card1-DP-1/enabled)

if [ "$edp" = "enabled" ]
then
    echo "eDP-1"
    if [ "$1" = "-U" ]
    then
        /usr/bin/light -U 10
        value=$(/usr/bin/light | awk '{split($1, arr, "."); print arr[1]}')
    elif [ "$1" = "-A" ]
    then
        /usr/bin/light -A 10
        value=$(/usr/bin/light | awk '{split($1, arr, "."); print arr[1]}')
    else
        echo "please input -U or -A"
    fi
    echo $value > /run/user/1000/wob.sock
    echo $value > /run/user/1000/light.sock

elif [ "$dp" = "enabled" ]
then
    echo "DP-1"
    value=$(/home/arch/.local/bin/monitor-control DP-1 0x10 | awk '{print $1}')
    if [ "$1" = "-U" ]
    then
        value=$(($value - 10))
        if [ "$value" -lt "0" ]
        then
            value="0"
        fi
        echo $value
        /home/arch/.local/bin/monitor-control DP-1 0x10 $value > /run/user/1000/wob.sock
    elif [ "$1" = "-A" ]
    then
        value=$(($value + 10))
        if [ "$value" -gt "100" ]
        then
            value="100"
        fi
        echo $value
        /home/arch/.local/bin/monitor-control DP-1 0x10 $value > /run/user/1000/wob.sock
    else
        echo "please input -U or -A"
    fi
    echo $value > /run/user/1000/light.sock
fi

