#!/bin/bash

prefix=":x :y :width :height"

if [ "$1" == "" ] || [ "$2" == "" ]
then
    echo "usage: command <file name> <scale times>"
    exit 0
fi

if [ -e $1.save ]
then
    cp $1.save $1
else
    cp $1 $1.save
fi

for i in $prefix
do
    content=$(grep -E "$i [0-9]+" $1 -o | uniq | grep -E "[0-9]+" -o)
    for j in $content
    do
        new_value=$(echo "$j * $2 + 0.5" | bc | awk '{split($1, arr, "."); print arr[1]}')
        sed "s/${i} ${j}/${i} ${new_value}/g" $1 -i 
    done
    echo "-------"

done
