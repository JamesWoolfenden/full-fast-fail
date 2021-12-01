# fail
# CKV_AWS_23: "Ensure every security groups rule has a description"
# todo should flag as not using a vpc - although this seems pretty legacy to me

# tfsec
# AWS003 Resource 'aws_elasticache_security_group.bar' uses EC2 Classic. Use a VPC instead.
resource "aws_elasticache_security_group" "bar" {
  name                 = "elasticache-security-group"
  security_group_names = [aws_security_group.bar.name]
}
