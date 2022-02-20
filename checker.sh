#!/usr/bin/env bash

RED="\e[31m"
ORANGE="\e[33m"
BLUE="\e[94m"
GREEN="\e[92m"
STOP="\e[0m"

printf "${BLUE}"
figlet -w 200 -f small "Checker"
file="fails.json"
path="${1:-.}"

echo "Scanning path:$path"

if [ -f "$file" ]; then
  rm "$file"
fi

#define expectations
expected=955

# run the tools
checkov -o json -d $path >"$path/$file"

terraform=$(cat "$path/$file" | jq '.[]| select("check_type")| .summary.failed')
counts=$(cat "$path/$file" | jq '.[]| select("check_type")| .summary.resource_count')

for i in ${terraform[@]}; do
  let total+=$i
done

for i in ${counts[@]}; do
  let resources+=$i
done

printf "${RED}"

figlet -w 200 -f small "Results"
echo "Found Checkov $total"
echo "Resource count: $resources"
echo "Expected: $expected and found: $total"

figlet Versions

echo $(terraform version)
echo "Checkov $(checkov -v)"

printf "${STOP}"
# shellcheck disable=SC2086
if [ $total != $expected ]; then
  exit 1
fi
exit 0
