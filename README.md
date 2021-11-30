
# full-fast-fail

Fed up with getting it all right all the time? Isn't it tiresome, yes very, so here's the opposite. Trying to get absolutely nothing right.

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

```data
 checkov -o json -d . >results.json
 checkov -o json -d . | jq '.[]| select(.check_type=="secrets")'
 checkov -o json -d . | jq '.[]| select(.check_type=="terraform")| .summary.failed'
 checkov -o json -d . | jq '.[]| .summary.failed'

 cat results.json | jq '.[]| select(.check_type=="secrets")'
 terraform=$(cat results.json | jq '.[]| select(.check_type=="terraform")| .summary.failed')
 secrets=$(cat results.json | jq '.[]| select(.check_type=="secrets")| .summary.failed')
 total=$(($secrets+$terraform))
```

## testing

Run to see what rules are being triggered/passed.

```bash
 $failure.sh
```
