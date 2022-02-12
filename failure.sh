#!/usr/bin/env bash
path="${1:-.}"

RED="\e[31m"
ORANGE="\e[33m"
BLUE="\e[94m"
GREEN="\e[92m"
STOP="\e[0m"

printf "${BLUE}"
figlet -w 200 -f  small "Finding Failures.."
file="$path/fails.txt"

if [ -f "$file" ] ; then
    rm "$file"
fi

checkov  -d $path >$file
echo .
tfsec $path -f json --out "$path/fails_tfsec.txt" 2> /dev/null
echo .
kics scan -p $path -o $path --output-name "fails-kics.txt"

printf "${STOP}"

echo finished!
