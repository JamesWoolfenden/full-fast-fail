#!/usr/bin/env bash

RED="\e[31m"
ORANGE="\e[33m"
BLUE="\e[94m"
GREEN="\e[92m"
STOP="\e[0m"

printf "${BLUE}"
figlet -w 200 -f  small "Checkov Scan"
file="results.json"
path="${1:-.}"

echo "Scanning path:$path"

if [ -f "$file" ]; then
    rm "$file"
fi

#define expectations
expected=1542

# run the tools
checkov -o json -d $path >"$path/$file"

terraform=$(cat "$path/$file" | jq '.[]| select(.check_type=="terraform")| .summary.failed')
secrets=$(cat "$path/$file" | jq '.[]| select(.check_type=="secrets")| .summary.failed')
total=$(($secrets + $terraform))

printf "${RED}"

figlet -w 200 -f  small "Results"
echo "Found Terraform $terraform"
echo "Found Secrets $secrets"

echo "Expected: $expected and found: $total"
printf "${STOP}"
# shellcheck disable=SC2086
if [ $total != $expected ]; then
    exit 1
fi
exit 0
