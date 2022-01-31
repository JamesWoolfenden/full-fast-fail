param (
    [string]$path = ".",
    [int]$expected = 1044)


function scan {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $path = "."
    )
    return (checkov -o json -d $path) | ConvertFrom-Json
}


figlet "Checkov Scan"

# run the tools
$checkov = scan

$terraform = $checkov[0].results.failed_checks.Length
$secrets = $checkov[4].results.failed_checks.Length
$total = $secrets + $terraform


if ( $total -ne $expected ) {
    write-host "Error: expected $expected but found $total"
    exit 1
}

figlet Results
write-host "Found Terraform $terraform"
write-host "Found Secrets $secrets"

write-host "Expected: $expected and found: $total"
figlet Versions

terraform version
write-output "Checkov $(checkov -v)"
exit 0
