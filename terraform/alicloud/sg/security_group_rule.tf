# Fails

# Ensure no security groups allow ingress from 0.0.0.0:0 to port 22Checkov (CKV_ALI_2)
# Ensure no security groups allow ingress from 0.0.0.0:0 to port 3389Checkov (CKV_ALI_3)
resource "alicloud_security_group_rule" "allow_all_low" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "internet"
  policy            = "accept"
  port_range        = "1/100"
  security_group_id = alicloud_security_group.default.id
  cidr_ip           = "0.0.0.0/0"
}

resource "alicloud_security_group_rule" "allow_all_high" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "internet"
  policy            = "accept"
  port_range        = "101/65535"
  security_group_id = alicloud_security_group.default.id
  cidr_ip           = "0.0.0.0/0"
}
