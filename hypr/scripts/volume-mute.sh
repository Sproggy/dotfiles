#!/bin/bash
wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
echo 0 > /tmp/wobpipe
