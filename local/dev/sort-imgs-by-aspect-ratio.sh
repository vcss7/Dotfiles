#!/bin/sh

# check for dependencies
if [ ! "$(command -v magick identify)" ]; then
    echo "Please install imagemagick"
    exit 1
fi

DIRECTORY="$HOME/Pictures/wallpapers"

# check for directory
[ -d "$DIRECTORY" ] || mkdir -p ~/Pictures/wallpapers


# check all for images
find . -type f | while read -r f
do
    # TODO: Fix this atrocity
    if identify "$f" > /dev/null 2>&1; then
        RES="$(identify "$f" | awk '{print $3}' | sed 's/x/ /')"
        WIDTH="$(echo "$RES" | awk '{print $1}')"
        HEIGHT="$(echo "$RES" | awk '{print $2}')"
    fi
done

# 
