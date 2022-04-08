#!/usr/bin/env bash
folder="${1:-.}"
framework="${2:-all}"
figlet Compare Tools

file="fails.json"

if [ -f "$file" ]; then
    rm "$file"
fi

#define expectations
expected=954
tfexpected=917
kicsexpected=2704

# run the tools
echo checkov --framework $framework --download-external-modules .external_modules -o json -d $folder >"$folder/$file"
checkov --framework $framework --download-external-modules .external_modules -o json -d $folder >"$folder/$file"

tfsec $folder -f json -s --out "$folder/fails_tfsec.json"
# snyk iac test . --json-file-output="synk__$file"  2> /dev/null
terrascan scan -d $folder -x json -o json >"$folder/fails_terrascan.json"
kics scan -s -p $folder -o $folder --output-name "fails_kics.json"
kics_count=$(cat "$folder/fails_kics.json" | jq -r '.total_counter')

terrascan_count=$(cat "$folder/fails_terrascan.json" | jq -r '.results.scan_summary.policies_validated')
tfsec_count=$(cat "$folder/fails_tfsec.json" | jq -r '.results | length')
terraform=$(cat "$folder/$file" | jq '.[]| select(.check_type)| .summary.failed') 2>/dev/null
resource=$(cat "$folder/$file" | jq '.[]| select(.check_type)| .summary.resource_count') 2>/dev/null

if [ -z "$terraform" ]; then
    terraform=$(cat "$folder/$file" | jq '.| select(.check_type)| .summary.failed')
    resource=$(cat "$folder/$file" | jq '.| select(.check_type)| .summary.resource_count')
fi

for i in ${terraform[@]}; do
    let total+=$i
done

for i in ${resource[@]}; do
    let resources+=$i
done

# shellcheck disable=SC2086
if [ $total != $expected ]; then
    echo "Error: Checkov expected $expected but found $total"
fi

# shellcheck disable=SC2086
if [ $tfsec_count != $tfexpected ]; then
    echo "Error: Tfsec expected $tfexpected but found $tfsec_count"
fi

# shellcheck disable=SC2086
if [ $tfsec_count -gt $total ]; then
    echo "Error: Tfsec found more $tfsec_count but we found $total"
fi

# shellcheck disable=SC2086
if [ $kics_count -gt $total ]; then
    echo "Error: Kics found more $kics_count but we found $total"
fi

echo "# Summary" >"$folder/summary.md"
echo -e "" >>"$folder/summary.md"
echo "- Found Checkov $total" >>"$folder/summary.md"
echo "- Found TFSec $tfsec_count" >>"$folder/summary.md"
echo "- Found Kics $kics_count" >>"$folder/summary.md"
echo "- Found Terrascan $terrascan_count" >>"$folder/summary.md"
echo "- Resource count $resources" >>"$folder/summary.md"

figlet Versions
echo -e "" >>"$folder/summary.md"

echo "## Versions" >>"$folder/summary.md"
echo -e "" >>"$folder/summary.md"
echo "- $(terraform version)" >>"$folder/summary.md"
echo "- Checkov $(checkov -v)" >>"$folder/summary.md"
echo "- Tfsec $(tfsec -version)" >>"$folder/summary.md"
echo "- Kics $(kics version)" >>"$folder/summary.md"
echo "- Terrascan $(terrascan version)" >>"$folder/summary.md"

exit 0
