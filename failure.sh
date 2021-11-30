#!/usr/bin/env bash

file="fails.txt"

if [ -f "$file" ] ; then
    rm "$file"
fi

checkov  -d . >$file
echo finished!
