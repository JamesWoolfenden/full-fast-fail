
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

## compare

```bash
Run this to see how SAST tools compare on a code base

./compare.sh
   ____                                       _____           _
  / ___|___  _ __ ___  _ __   __ _ _ __ ___  |_   _|__   ___ | |___
 | |   / _ \| '_ ` _ \| '_ \ / _` | '__/ _ \   | |/ _ \ / _ \| / __|
 | |__| (_) | | | | | | |_) | (_| | | |  __/   | | (_) | (_) | \__ \
  \____\___/|_| |_| |_| .__/ \__,_|_|  \___|   |_|\___/ \___/|_|___/
                      |_|
Error: Checkov expected 1314 but found 1322
Error: Tfsec expected 346 but found 370
Found Terraform 1308
Found Secrets 14
Found Kics
Expected 1314 and found 1322
Checkov: 1322 TFSec: 370
```
