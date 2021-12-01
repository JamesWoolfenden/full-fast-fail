#!/usr/bin/env bash
figlet Compare Tools

file="results.json"

if [ -f "$file" ] ; then
    rm "$file"
fi

#define expectations
expected=271
tfexpected=194

# run the tools
checkov -o json -d . >$file

tfsec -f json -s --out "tfsec_$file"  2> /dev/null

tfsec_count=$(cat "tfsec_$file" | jq -r '.results | length')
terraform=$(cat $file | jq '.[]| select(.check_type=="terraform")| .summary.failed')
secrets=$(cat $file | jq '.[]| select(.check_type=="secrets")| .summary.failed')
total=$(($secrets+$terraform))


# shellcheck disable=SC2086
if [ $total != $expected  ]; then
    echo "Error: expected $expected but found $total"
fi

# shellcheck disable=SC2086
if [ $tfsec_count != $tfexpected  ]; then
    echo "Error: Tfsec expected $tfexpected but found $tfsec_count"
fi

# shellcheck disable=SC2086
if [ $tfsec_count -gt $total ]; then
    echo "Error: Tfsec found more $tfsex_count but we found $total"
fi

echo "Found Terraform $terraform"
echo "Found Secrets $secrets"
echo "Found TFSec $tfsec_count"

echo "Expected $expected and found $total"
echo "Checkov: $total TFSec: $tfsec_count"
exit 0
