
resource "openstack_fw_rule_v1" "rule_1" {
  name             = "my_rule"
  description      = "let anyone in"
  action           = "allow"
  protocol         = "tcp"
  destination_port = "22"
  enabled          = "true"
}
