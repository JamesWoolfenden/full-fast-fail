#!/usr/bin/env bash

figlet "Finding Failures.."
file="fails.txt"

if [ -f "$file" ] ; then
    rm "$file"
fi

checkov  -d . >$file
echo .
tfsec -f json --out fails_tfsec.txt 2> /dev/null
echo .
kics scan -p . -o . --output-name fails-kics.txt

echo finished!
