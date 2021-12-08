# fails
# todo implement tfsec rules
# todo implement tfsec rules


# tfsec
# AWS049 Resource 'aws_network_acl_rule.fail' defines a Network ACL rule that allows specific ingress ports from anywhere.
# AWS050 Resource 'aws_network_acl_rule.fail' defines a fully open ingress Network ACL rule with ALL ports open.
resource "aws_network_acl_rule" "fail" {
  egress      = false
  protocol    = "all"
  rule_action = "allow"
  cidr_block  = "0.0.0.0/0"
}
