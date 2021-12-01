param (
    [string]$path=".",
    [int]$expected=180,
    [int]$tfexpected=87)

#Uses  npm install -g figlet-cli

figlet Compare Tools

# run the tools
$checkov=(checkov -o json -d $path)|ConvertFrom-Json

$tfsec=(tfsec $path -f json )|ConvertFrom-Json

$tfsec_count=$tfsec.results.Length
$terraform=$checkov[0].results.failed_checks.Length
$secrets=$checkov[4].results.failed_checks.Length
$total=$secrets+$terraform


if ($total -ne $expected) {
   Write-Host "Error: Checkov expected $expected but found $total"
}

if ($tfsec_count -ne $tfexpected)
{
   Write-Host "Error: Tfsec expected $tfexpected but found $tfsec_count"
}

if ($tfsec_count -gt $total)
{
       Write-Host "Error: Tfsec found more $tfsex_count but we found $total"
}

Write-Host "Found Terraform $terraform"
Write-Host "Found Secrets $secrets"
Write-Host "Found TFSec $tfsec_count"

Write-Host "Expected $expected and found $total"
Write-Host "Checkov: $total TFSec: $tfsec_count"
exit 0
