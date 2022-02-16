param (
    [string]$path = "terraform",
    [int]$expected = 1542)

if (!(test-path -Path $path)) {
    Write-Error "path $path not found"
    exit 1
}

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

$total = $checkov.results.failed_checks.Length
$count = $checkov.results.resource_count.Length



if ( $total -ne $expected ) {
    write-host "Error: expected $expected but found $total"
    exit 1
}

figlet Results
write-host "Found Terraform $total"
write-host "Resource Count: $count"

write-host "Expected: $expected and found: $total"
figlet Versions

terraform version
write-output "Checkov $(checkov -v)"
exit 0
