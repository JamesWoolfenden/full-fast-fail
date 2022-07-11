# check key status is not disabled
# automatic rotation? enabled. default is disabled
# todo rotation period is less than 1 year

resource "alicloud_kms_key" "pass" {
  description            = "Hello KMS"
  pending_window_in_days = "7"
  status                 = "Enabled"
}

resource "alicloud_kms_key" "pass2" {
  description            = "Hello KMS"
  pending_window_in_days = "7"
}

resource "alicloud_kms_key" "fail2" {
  description            = "Hello KMS"
  pending_window_in_days = "7"
  status                 = "Disabled"
}
