#Uses  npm install -g figlet-cli

figlet "Finding Failures..."
$file="fails.txt"

remove-item $file -ErrorAction SilentlyContinue

checkov  -d . >$file
Write-Host .

tfsec -f json --out fails_tfsec.txt

kics scan -p . -o . --output-name fails_kics.txt

Write-Host Finished
exit 0
