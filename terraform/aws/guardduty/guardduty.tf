# fail
# CKV2_AWS_3: "Ensure GuardDuty is enabled to specific org/region"
resource "aws_guardduty_detector" "not_ok_false" {
  enable = true
  tags   = { test = "Fail" }
}

resource "aws_guardduty_organization_configuration" "example" {
  auto_enable = false
  detector_id = aws_guardduty_detector.not_ok_false.id

}
