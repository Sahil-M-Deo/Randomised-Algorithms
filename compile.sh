#!/bin/bash

CHAPTER=$1
FILE="source files/report.tex"

if [ -z "$CHAPTER" ]; then
    make
    exit 0
fi

cp "$FILE" "$FILE.bak"
trap 'mv "$FILE.bak" "$FILE"' EXIT

if [ "$CHAPTER" = "a" ]; then
    awk '
    NR==2{print "\\includeonly{appendices}"}
    {print}
    ' "$FILE" > "$FILE.tmp" && mv "$FILE.tmp" "$FILE"
else
    awk -v ch="$CHAPTER" '
    NR==2{print "\\includeonly{ch" ch "}"}
    {print}
    ' "$FILE" > "$FILE.tmp" && mv "$FILE.tmp" "$FILE"
fi


make