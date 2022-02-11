param (
   [string]$path = ".",
   [int]$expected = 1542,
   [int]$tfexpected = 1255,
   [int]$kicsexpected = 3796)

#Uses  npm install -g figlet-cli

figlet Compare Tools

# run the tools
$checkov = (checkov -o json -d $path) | ConvertFrom-Json

kics scan -p . -o . --output-name fails-kics.json
$kics_count=(cat fails-kics.json)|ConvertFrom-Json
$kics_total=$kics_count.total_counter

$tfsec = (tfsec $path -f json ) | ConvertFrom-Json

$tfsec_count = $tfsec.results.Length
$terraform = $checkov[0].results.failed_checks.Length
$secrets = $checkov[4].results.failed_checks.Length
$total = $secrets + $terraform


if ($total -ne $expected) {
   Write-Host "Error: Checkov expected $expected but found $total"
}

if ($tfsec_count -ne $tfexpected) {
   Write-Host "Error: Tfsec expected $tfexpected but found $tfsec_count"
}

if ($kics_total -gt $total)
{
   Write-Host "Error: Kics expected $kicsexpected but found $kics_total"
}


Write-Host "Found Terraform $terraform"
Write-Host "Found Secrets $secrets"
Write-Host "Found TFSec $tfsec_count"
Write-Host "Found Kics $kics_total"


Write-Host "Expected $expected and found $total"
Write-Host "Checkov: $total TFSec: $tfsec_count Kics: $kics_total"


figlet Versions

terraform version
write-output "Checkov $(checkov -v)"
write-output "tfsec $(tfsec -version)"
write-output "kics $(kics version)"
exit 0
