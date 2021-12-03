# fails
# CKV_OCI_18: "OCI IAM password policy for local (non-federated) users has a minimum length of 14 characters"
# CKV_OCI_11: "OCI IAM password policy - must contain lower case"
# CKV_OCI_12: "OCI IAM password policy - must contain Numeric characters"
# CKV_OCI_13: "OCI IAM password policy - must contain Special characters"
# CKV_OCI_14: "OCI IAM password policy - must contain Uppercase characters"

resource "oci_identity_authentication_policy" "fail" {

  compartment_id = var.tenancy_id

  password_policy {
    is_lowercase_characters_required = false
    is_numeric_characters_required   = false
    is_special_characters_required   = false
    is_uppercase_characters_required = false
    is_username_containment_allowed  = false
    minimum_password_length          = 13
  }
}
