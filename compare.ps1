param (
   [string]$path = ".",
   [int]$expected = 1341,
   [int]$tfexpected = 917,
   [int]$kicsexpected = 2704)

if (!(test-path -Path $path)) {
      Write-Error "path $path not found"
      exit 1
}

#Uses  npm install -g figlet-cli

figlet Compare Tools

write-host -f red "Scanning $path"

# run the tools
$location="$path\fails.json"
Write-Debug $location
rm -f "$location"

checkov -o json -d $path > "$location"
$checkov = (get-content "$location")|ConvertFrom-Json

kics scan -s -p $path -o $path --output-name "fails_kics.json"
$kics_count=(Get-Content "$path\fails_kics.json")|ConvertFrom-Json
$kics_total=$kics_count.total_counter

$tfsec = (tfsec $path -f json ) | ConvertFrom-Json
$tfsec_count = $tfsec.results.Length

foreach($i in $checkov.summary.failed) {
   $total+=$i
}

foreach($i in $checkov.summary.resource_count) {
   $resources+=$i
}

if ($path -eq ".") {
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

   Write-Host "Expected $expected and found $total"
   Write-Host "Checkov: $total TFSec: $tfsec_count Kics: $kics_total"
}

Write-Output "# Summary" | Out-File $path\"summary.md"
Write-Output "`n" | Out-File $path\"summary.md" -Append -NoNewline
Write-Output "- Found Terraform $total"  | Out-File $path\"summary.md" -Append
Write-Output "- Found TFSec $tfsec_count"  | Out-File $path\"summary.md" -Append
Write-Output "- Found Kics $kics_total" | Out-File $path\"summary.md" -Append
Write-Output "- Resource count $resources" | Out-File $path\"summary.md" -Append

figlet Versions

Write-Output "`n" | Out-File $path\"summary.md" -Append -NoNewline
Write-Output "## Versions" | Out-File $path\"summary.md" -Append
Write-Output "`n" | Out-File $path\"summary.md" -Append -NoNewline
Write-Output "- $(terraform version)"  | Out-File $path\"summary.md" -Append
Write-Output "- Checkov $(checkov -v)" | Out-File $path\"summary.md" -Append
Write-Output "- Tfsec $(tfsec -version)" | Out-File $path\"summary.md" -Append
Write-Output "- Kics $(kics version)" | Out-File $path\"summary.md" -Append
Show-Markdown $path\"summary.md"
exit 0
