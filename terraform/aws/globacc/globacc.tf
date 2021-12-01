#fail
# CKV_AWS_75: "Ensure Global Accelerator accelerator has flow logs enabled"

resource "aws_globalaccelerator_accelerator" "example" {
  name            = "Example"
  ip_address_type = "IPV4"
  enabled         = true
  attributes {
    flow_logs_enabled = false
  }
}
