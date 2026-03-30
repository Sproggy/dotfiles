#!/bin/bash
wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2*100)}')
echo $volume > /tmp/wobpipe
