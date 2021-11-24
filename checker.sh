#!/usr/bin/env bash

file="results.json"

if [ -f "$file" ] ; then
    rm "$file"
fi

 #define expectations
 expected=13

 checkov -o json -d . >$file
 terraform=$(cat results.json | jq '.[]| select(.check_type=="terraform")| .summary.failed')
 secrets=$(cat results.json | jq '.[]| select(.check_type=="secrets")| .summary.failed')
 total=$(($secrets+$terraform))

# shellcheck disable=SC2086
if [ $total != $expected  ]; then
    echo "Error expected $expected but found $total"
    exit 1
fi

echo "Found Terraform $terraform"
echo "Found Secrets $secrets"

echo "Found Expected $expected and found $total"
exit 0