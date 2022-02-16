# fail
# CKV_AWS_23: "Ensure every security groups rule has a description"
# CKV_AWS_196:"Ensure no aws_elasticache_security_group resources exist"

# tfsec
# AWS003 Resource 'aws_elasticache_security_group.bar' uses EC2 Classic. Use a VPC instead.
resource "aws_elasticache_security_group" "fail" {
  name                 = "elasticache-security-group"
  security_group_names = [aws_security_group.bar.name]

}
