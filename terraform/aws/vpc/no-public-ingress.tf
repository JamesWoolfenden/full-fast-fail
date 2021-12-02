
resource "aws_network_acl_rule" "fail" {
  egress      = false
  protocol    = "tcp"
  from_port   = 22
  to_port     = 22
  rule_action = "allow"
  cidr_block  = "0.0.0.0/0"
}
