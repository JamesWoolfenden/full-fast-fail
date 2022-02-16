#!/usr/bin/env bash
folder="${1:-.}"
figlet Compare Tools

file="results.json"

if [ -f "$file" ] ; then
    rm "$file"
fi

#define expectations
expected=1362
tfexpected=917
kicsexpected=2704

# run the tools
checkov -o json -d $folder >"$folder/$file"

tfsec $folder -f json -s --out "$folder/tfsec_$file"  2> /dev/null
# snyk iac test . --json-file-output="synk__$file"  2> /dev/null
kics scan -s -p $folder -o $folder --output-name "kics_$file"
kics_count=$(cat "$folder/kics_$file"| jq -r '.total_counter')

tfsec_count=$(cat "$folder/tfsec_$file" | jq -r '.results | length')
terraform=$(cat "$folder/$file" | jq '.[]| select(.check_type)| .summary.failed') 2> /dev/null
resources=$(cat "$folder/$file" | jq '.[]| select(.check_type)| .summary.resource_count') 2> /dev/null

if [ -z "$terraform" ]; then
    terraform=$(cat "$folder/$file" | jq '.| select(.check_type)| .summary.failed')
    resources=$(cat "$folder/$file" | jq '.| select(.check_type)| .summary.resource_count')
fi

for i in ${terraform[@]}; do                                                                                                
  let total+=$i
done

# shellcheck disable=SC2086
if [ $total != $expected  ]; then
    echo "Error: Checkov expected $expected but found $total"
fi

# shellcheck disable=SC2086
if [ $tfsec_count != $tfexpected  ]; then
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


echo "# Summary" > "$folder/summary.md"
echo -e ""  >>"$folder/summary.md"
echo "- Found Checkov $total" >>"$folder/summary.md"
echo "- Found TFSec $tfsec_count" >>"$folder/summary.md"
echo "- Found Kics $kics_count" >>"$folder/summary.md"
echo "- Resource count $resources" >>"$folder/summary.md"

figlet Versions
echo -e ""  >>"$folder/summary.md"

echo "## Versions" >>"$folder/summary.md"
echo -e "" >>"$folder/summary.md"
echo "- $(terraform version)"  >>"$folder/summary.md"
echo "- Checkov $(checkov -v)" >>"$folder/summary.md"
echo "- Tfsec $(tfsec -version)" >>"$folder/summary.md"
echo "- Kics $(kics version)" >>"$folder/summary.md"

exit 0
