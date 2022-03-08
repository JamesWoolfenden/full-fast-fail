# fails
# CKV_AWS_237 check that it is not disabled
# Ensure GuardDuty is enabled to specific org/regionCheckov CKV2_AWS_3
resource "aws_guardduty_detector" "positive1" {
  enable = false
  tags   = { test = "Fail" }
}
