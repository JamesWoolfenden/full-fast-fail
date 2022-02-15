param (
   [string]$path = ".")
#Uses  npm install -g figlet-cli

if (!(test-path -Path $path)) {
    Write-Error "path $path not found"
    exit 1
}

figlet "Finding Failures..."
$file="fails.json"

remove-item $file -ErrorAction SilentlyContinue

checkov  -d $path -o json >"$path\$file"
Write-Host .

tfsec $path -f json --out "$path\fails_tfsec.json"

kics scan -s -p $path -o $path --output-name "fails_kics.json"

Write-Host Finished
exit 0
