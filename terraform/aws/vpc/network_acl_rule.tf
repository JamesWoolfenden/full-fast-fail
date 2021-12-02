
resource "aws_network_acl_rule" "fail" {
  egress      = false
  protocol    = "all"
  rule_action = "allow"
  cidr_block  = "0.0.0.0/0"
}
