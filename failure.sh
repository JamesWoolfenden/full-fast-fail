#!/usr/bin/env bash
path="${1:-.}"

RED="\e[31m"
ORANGE="\e[33m"
BLUE="\e[94m"
GREEN="\e[92m"
STOP="\e[0m"

printf "${BLUE}"
figlet -w 200 -f  small "Finding Failures.."
file="$path/fails.json"

if [ -f "$file" ] ; then
    rm "$file"
fi

checkov  -d $path -o json >$file
echo .
tfsec $path -f json --out "$path/fails_$file" 2> /dev/null
echo .
kics scan -p $path -o $path --output-name "fails-$file"

printf "${STOP}"

echo finished!
