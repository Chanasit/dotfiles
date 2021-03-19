#!/bin/bash

# shell scipt to prepend i3status with more stuff

i3status --config ~/.config/i3/i3status.conf | while :
do
    read line
    LG=$(setxkbmap -query | awk '/layout/{print $2}')

    if [ $LG == "us" ]
    then
        dat="[{ \"full_text\": \"LANG: $LG\", \"color\":\"#FFFFFF\" },"
    else
        dat="[{ \"full_text\": \"LANG: $LG\", \"color\":\"#FFFFFF\" },"
    fi
    echo "${line/[/$dat}" || exit 1
done
