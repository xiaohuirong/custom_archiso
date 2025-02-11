#!/bin/bash

if [ "$1" = "-U" ]
then
    # 减小音量
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-
    value=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')
elif [ "$1" = "-A" ]
then
    # 增大音量
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+
    value=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')
else
    echo "please input -U or -A"
    exit 1
fi

echo $value > /run/user/1000/wob.sock
