# fail
# CKV_AWS_23: "Ensure every security groups rule has a description"
# todo create uses EC2 Classic. Use a VPC instead.

# tfsec
# AWS003 Resource 'aws_db_security_group.fail' uses EC2 Classic. Use a VPC instead.

resource "aws_db_security_group" "fail" {
}
