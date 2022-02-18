param (
    [string]$folder = "terraform",
    [int]$expected = 971)

if (!(test-path -Path $folder)) {
    Write-Error "path $folder not found"
    exit 1
}

function scan {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $folder = "."
    )
    return (checkov -o json -d $folder) | ConvertFrom-Json
}


figlet "Checker"

# run the tools
$checkov = scan $folder

foreach($i in $checkov.summary.failed) {
    $total+=$i
 }

 foreach($i in $checkov.summary.resource_count) {
    $count+=$i
 }

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
