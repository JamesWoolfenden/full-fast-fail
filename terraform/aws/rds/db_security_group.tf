# fail
# CKV_AWS_23: "Ensure every security groups rule has a description"
# todo create uses EC2 Classic. Use a VPC instead.
# todo ensure does not have public endpoint ingress.cidr no 0.0.0.0/0 or ::/0
# tfsec
# AWS003 Resource 'aws_db_security_group.fail' uses EC2 Classic. Use a VPC instead.

resource "aws_db_security_group" "fail" {
  tags = { test = "Fail" }
}
