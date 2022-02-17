# fails
# todo check that it is not disabled
resource "aws_guardduty_detector" "positive1" {
  enable = false
  tags   = { test = "Fail" }
}
