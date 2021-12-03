# fails
# todo

# tfsec
# defines a firewall rule with no restriction on source IP

resource "openstack_fw_rule_v1" "fail" {
  name             = "my_rule"
  description      = "let anyone in"
  action           = "allow"
  protocol         = "tcp"
  destination_port = "22"
  enabled          = "true"
}
