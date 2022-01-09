#!/bin/sh

# check for dependencies
if [ ! "$(command -v identify)" ]; then
    echo "Please install imagemagick"
    exit 1
fi

DIRECTORY="$HOME/Pictures/wallpapers"

# check for directory
[ -d "$DIRECTORY" ] || mkdir -p ~/Pictures/wallpapers


# find the greatest common factor between two numbers
find_gcf(){
    if [ "$1" -gt "$2" ]; then
        a="$1"; b="$2"
    else
        a="$2"; b="$1"
    fi

    while [ $((a % b)) -ne 0 ]; do
        temp="$a"
        a="$b"
        b="$((temp % b))"
    done
    echo "$b"
}


# check all for images
find . -type f | while read -r f
do
    # TODO: Fix this atrocity
    if identify "$f" > /dev/null 2>&1; then
        RES="$(identify "$f" | awk '{print $3}' | sed 's/x/ /')"
        WIDTH="$(echo "$RES" | awk '{print $1}')"
        HEIGHT="$(echo "$RES" | awk '{print $2}')"

        GCF="$(find_gcf "$WIDTH" "$HEIGHT")"
        ASPECT_RATIO="$((WIDTH / GCF))to$((HEIGHT / GCF))"
        echo "$ASPECT_RATIO"
    fi
done

# 
