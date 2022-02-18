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
