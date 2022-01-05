#!/usr/bin/env bash

# Bash Strict Mode
set -euo pipefail
IFS=$'\n\t'

# Start Script
ffmpeg -y \     # Overwrite output files without asking
-f x11grab \    # Input format X11
-s $(xdpyinfo | grep dimensions | awk '{print $2;}') \
-i :0.0 \
-f v4l2 -framerate 25 -video_size 320x240 -i /dev/video0 \
-filter_complex '[0:v]scale=-1:720[main];[1:v]scale=-1:240[overlay];[main][overlay]overlay=(main_w-overlay_w-25):(main_h-overlay_h-25)' \
-f alsa -i default \
out.mkv
