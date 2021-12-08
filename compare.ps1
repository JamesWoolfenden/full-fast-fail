param (
    [string]$path=".",
    [int]$expected=1579,
    [int]$tfexpected=277,
    [int]$kicsexpected=1294)

#Uses  npm install -g figlet-cli

figlet Compare Tools

# run the tools
$checkov=(checkov -o json -d $path)|ConvertFrom-Json

# kics scan -p . -o . --output-name fails-kics.json
# $kics_count=(cat fails-kics.json)|ConvertFrom-Json
# $kics_total=$kics_count.total_counter

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
   Write-Host "Error: Tfsec found more $tfsec_count but we found $total"
}

# if ($kics_total -gt $total)
# {
#    Write-Host "Error: Kics found more $kics_total but we found $total"
# }


Write-Host "Found Terraform $terraform"
Write-Host "Found Secrets $secrets"
# Write-Host "Found TFSec $tfsec_count"
Write-Host "Found Kics $kics_total"


Write-Host "Expected $expected and found $total"
Write-Host "Checkov: $total TFSec: $tfsec_count"
exit 0
