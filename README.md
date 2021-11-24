
 # fail
 ## Ensure that were finding what we should be

Run checker.sh 

## Success
```build
> ./checker.sh
Found Terraform 10
Found Secrets 3
Found Expected 13 and found 13
```
## Fail

```Error expected 14 but found 13```

```
 checkov -o json -d . >results.json
 checkov -o json -d . | jq '.[]| select(.check_type=="secrets")'
 checkov -o json -d . | jq '.[]| select(.check_type=="terraform")| .summary.failed'
 checkov -o json -d . | jq '.[]| .summary.failed'
 
 cat results.json | jq '.[]| select(.check_type=="secrets")'
 terraform=$(cat results.json | jq '.[]| select(.check_type=="terraform")| .summary.failed')
 secrets=$(cat results.json | jq '.[]| select(.check_type=="secrets")| .summary.failed')
 total=$(($secrets+$terraform))
```

