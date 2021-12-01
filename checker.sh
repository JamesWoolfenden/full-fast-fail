#!/usr/bin/env bash

figlet "Checkov Scan"
file="results.json"

if [ -f "$file" ] ; then
    rm "$file"
fi

#define expectations
expected=271

# run the tools
checkov -o json -d . >$file

terraform=$(cat $file | jq '.[]| select(.check_type=="terraform")| .summary.failed')
secrets=$(cat $file | jq '.[]| select(.check_type=="secrets")| .summary.failed')
total=$(($secrets+$terraform))


# shellcheck disable=SC2086
if [ $total != $expected  ]; then
    echo "Error: expected $expected but found $total"
    exit 1
fi

figlet Results
echo "Found Terraform $terraform"
echo "Found Secrets $secrets"

echo "Expected: $expected and found: $total"
exit 0
