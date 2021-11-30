#!/usr/bin/env bash

figlet "Analysing code.."
file="fails.txt"

if [ -f "$file" ] ; then
    rm "$file"
fi

checkov  -d . >$file
echo .
tfsec -f json --out fails_tfsec.txt 2> /dev/null
echo finished!
