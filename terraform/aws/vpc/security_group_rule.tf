# fails
# CKV_AWS_23: "Ensure every security groups rule has a description"
# todo CKV_AWS_25: "Ensure no security groups allow ingress from 0.0.0.0:0 to port 3389"
# todo CKV_AWS_24: "Ensure no security groups allow ingress from 0.0.0.0:0 to port 22"

# tfsec
# AWS018 Resource 'aws_security_group_rule.fail' should include a description for auditing purposes.

resource "aws_security_group_rule" "fail" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.example.cidr_block]
  ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  security_group_id = "sg-123456"
}
