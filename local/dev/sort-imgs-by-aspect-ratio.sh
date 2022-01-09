#!/bin/sh

# check for dependencies
if [ ! "$(command -v exiv2)" ]; then
    echo "Please install exiv2"
    exit 1
fi

DIRECTORY="$HOME/Pictures/wallpapers"

# check for directory
[ -d "$DIRECTORY" ] || mkdir -p ~/Pictures/wallpapers

