
resource "aws_elasticache_security_group" "bar" {
  name                 = "elasticache-security-group"
  security_group_names = [aws_security_group.bar.name]
}
