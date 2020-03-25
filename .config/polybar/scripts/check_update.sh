#/bin/bash

UPDATES=$(checkupdates 2> /dev/null | wc -l)

if [ "$UPDATES" -gt 0 ]; then
    echo "# $UPDATES"
else
    echo "# 0"
fi
