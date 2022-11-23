# fails
# CKV_ALI_17: "Ensure RAM password policy requires at least one lowercase letter"
# CKV_ALI_23: "Ensure Ram Account Password Policy Max Login Attempts not > 5"
# CKV_ALI_16: "Ensure RAM password policy expires passwords within 90 days or less"
# CKV_ALI_18: "Ensure RAM password policy prevents password reuse"
# CKV_ALI_19: "Ensure RAM password policy requires at least one uppercase letter"
# CKV_ALI_14: "Ensure RAM password policy requires at least one number"
# CKV_ALI_13: "Ensure RAM password policy requires minimum length of 14 or greater"
# CKV_ALI_24: "Ensure Ram Account Password Policy Max Age less than/equal to 90 days"
# CKV_ALI_15: "Ensure RAM password policy requires at least one symbol"
resource "alicloud_ram_account_password_policy" "corporate" {
  minimum_password_length      = 9
  require_lowercase_characters = false
  require_uppercase_characters = false
  require_numbers              = false
  require_symbols              = false
  hard_expiry                  = true
  max_password_age             = 120
  password_reuse_prevention    = 5
  max_login_attempts           = 6
}
