# Fails
# todo rotation period is less than 1 year
# CKV_ALI_27: "Ensure KMS Key Rotation is enabled"
# CKV_ALI_28: "Ensure KMS Keys are enabled"

resource "alicloud_kms_key" "fail2" {
  description            = "Hello KMS"
  pending_window_in_days = "7"
  status                 = "Disabled"
}
