param (
    [string]$path=".")


    function scan {
        [CmdletBinding()]
        param (
            [Parameter()]
            [string]
            $path="."
        )
        return measure-command -expression {checkov -d $path}
    }

    function aquasec {
        [CmdletBinding()]
        param (
            [Parameter()]
            [string]
            $path="."
        )
        return measure-command -expression {tfsec $path}
    }


figlet "Timings"

# run the tools
$checkovTime=scan
$tfsecTime=aquasec

Write-Host Checkov $checkovTime.TotalMilliseconds
Write-Host Tfsec $tfsecTime.TotalMilliseconds

Write-Host Diff ($checkovTime-$tfsecTime).TotalMilliseconds
write-host "Checkov is $(($checkovTime.TotalMilliseconds/$tfsecTime.TotalMilliseconds)*100) % of tfsec time"
