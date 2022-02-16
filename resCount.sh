#!/usr/bin/env bash

RED="\e[31m"
ORANGE="\e[33m"
BLUE="\e[94m"
GREEN="\e[92m"
STOP="\e[0m"

printf "${BLUE}"
figlet -w 200 -f  small "Resource Count"
file="fails.json"
path="${1:-.}"

echo "Scanning path:$path"

if [ -f "$file" ]; then
    rm "$file"
fi


# run the tools
checkov -o json -d $path >"$path/$file"

terraform=$(cat "$path/$file" | jq '.[]| select("check_type")| .summary.resource_count') 

if [ -z "$terraform" ]; then
    terraform=$(cat "$path/$file" | jq '.| select(.check_type)| .summary.resource_count')
fi

for i in ${terraform[@]}; do
  let total+=$i
done

printf "${RED}"

figlet -w 200 -f  small "Results"

echo "Resource Count: $total"
printf "${STOP}"

exit 0
