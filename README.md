
# full-fast-fail

Fed up with getting it all right all the time? Isn't it tiresome, yes very, so here's the opposite. Trying to get absolutely nothing right.

Currently compares Checkoc, Tfsec and KICS.
The counts are automated and sometimes highlight faults in the runners if they crash.

## Ensure that were finding what we should be

Run checker.sh

## Success

```build
> ./checker.sh
   ____ _               _
  / ___| |__   ___  ___| | _____ _ __
 | |   | '_ \ / _ \/ __| |/ / _ \ '__|
 | |___| | | |  __/ (__|   <  __/ |
  \____|_| |_|\___|\___|_|\_\___|_|

Error: expected 954 but found 955
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
Scanning .
1 file(s) written: .\fails_tfsec.json
Error: Checkov expected 954 but found 3993
Error: Tfsec expected 917 but found 6
Error: Kics expected 2704 but found 4680
Expected 954 and found 3993
Checkov: 3993 TFSec: 6 Kics: 4680
 __     __            _
 \ \   / /__ _ __ ___(_) ___  _ __  ___
  \ \ / / _ \ '__/ __| |/ _ \| '_ \/ __|
   \ V /  __/ |  \__ \ | (_) | | | \__ \
    \_/ \___|_|  |___/_|\___/|_| |_|___/

Summary

- Found Checkov 3993
- Found TFSec 6
- Found Kics 4680
- Resource count 1235

Versions

- Terraform v1.1.3 on windows_amd64
- Checkov 2.0.873
- Tfsec You are running a locally built version of tfsec.
- Kics Keeping Infrastructure as Code Secure 1.4.9
```

This currently shows that Tfsec is currently crashing on some tf code. So im building the lastest TFsec to see if that works better.

Check out the cumulative totals in each folder: <https://github.com/JamesWoolfenden/full-fast-fail/blob/main/summary.md>

Or if you only interested in Terraform <https://github.com/JamesWoolfenden/full-fast-fail/blob/main/terraform/summary.md>
