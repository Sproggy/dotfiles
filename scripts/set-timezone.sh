#!/bin/bash
#
# Edit This file to match your timezone locally
#
sudo timedatectl set-timezone Europe/London

sudo timedatectl set-ntp true

sudo timedatectl set-local-rtc 0