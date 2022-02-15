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

tfsec $path -f json --out "$path\fails_$file"

kics scan -s -p $path -o $path --output-name "fails_$file"

Write-Host Finished
exit 0
