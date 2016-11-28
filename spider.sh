#!/bin/bash

HOME="http://www.yourdomain.com/some/page"
DOMAINS="yourdomain.com"
DEPTH=2
OUTPUT="./urls.csv"

wget -r --spider --delete-after --force-html -D "$DOMAINS" -l $DEPTH "$HOME" 2>&1 \
    | grep '^--' | awk '{ print $3 }' | grep -v '\. \(css\|js\|png\|gif\|jpg\)$' | sort | uniq > $OUTPUT
