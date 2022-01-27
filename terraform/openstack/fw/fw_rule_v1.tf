# fails
# todo defines a firewall rule with no restriction on destination IP 
# todo defines a firewall rule with no restriction on source IP

# tfsec
# defines a firewall rule with no restriction on source IP

resource "openstack_fw_rule_v1" "fail" {
  name             = "my_rule"
  description      = "let anyone in"
  action           = "allow"
  protocol         = "tcp"
  destination_port = "22"
  enabled          = "true"
  # destination_ip_address = "10.0.0.1"
}

