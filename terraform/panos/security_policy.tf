# fails
# Ensure security rules do not have 'source_addresses' and 'destination_addresses' both containing values of 'any' Checkov (CKV_PAN_7)
# Ensure description is populated within security policiesCheckov (CKV_PAN_8)
# Ensure security rules do not have 'applications' set to 'any' Checkov (CKV_PAN_5)
# Ensure a Log Forwarding Profile is selected for each security policy ruleCheckov (CKV_PAN_9)
# Ensure security rules do not have 'services' set to 'any' Checkov (CKV_PAN_6)
resource "panos_security_policy" "fail1" {
  rule {
    name                  = "my-bad-rule-fail1"
    source_zones          = ["any"]
    source_addresses      = ["any"]
    source_users          = ["any"]
    hip_profiles          = ["any"]
    destination_zones     = ["any"]
    destination_addresses = ["any"]
    applications          = ["any"]
    categories            = ["any"]
    services              = ["any"]
    action                = "allow"
    log_end               = false
  }
}

resource "panos_security_policy" "fail2" {
  rule {
    name                               = "my-bad-rule-fail1"
    source_zones                       = ["any"]
    source_addresses                   = ["any"]
    source_users                       = ["any"]
    hip_profiles                       = ["any"]
    destination_zones                  = ["any"]
    destination_addresses              = ["any"]
    applications                       = ["any"]
    categories                         = ["any"]
    services                           = ["any"]
    action                             = "allow"
    disable_server_response_inspection = true
  }
}

resource "panos_security_policy" "fail3" {
  rule {
    name                  = "my-bad-rule-fail1"
    source_zones          = ["any"]
    source_addresses      = ["any"]
    source_users          = ["any"]
    hip_profiles          = ["any"]
    destination_zones     = ["any"]
    destination_addresses = ["any"]
    applications          = ["web-browsing", "ssl"]
    categories            = ["any"]
    services              = ["any"]
    action                = "allow"
  }
}
