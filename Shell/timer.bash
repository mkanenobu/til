#!/bin/bash
input="$1"
remain=$((input * 60))
sleep "$remain" && \
mpv /usr/share/sounds/ubuntu/ringtones/Counterpoint.ogg &
#for i in $(seq 1 "$remain");do
#    echo -n "|"
#    sleep 1
#done
