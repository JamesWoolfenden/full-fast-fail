resource "aws_globalaccelerator_accelerator" "example" {
  name            = "Example"
  ip_address_type = "IPV4"
  enabled         = true
  attributes {
    flow_logs_enabled   = false
  }
}