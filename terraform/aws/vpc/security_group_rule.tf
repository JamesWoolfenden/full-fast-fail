
resource "aws_security_group_rule" "fail" {
  type        = "egress"
  cidr_blocks = ["0.0.0.0/0"]
}


resource "aws_security_group_rule" "fail2" {
  type        = "ingress"
  cidr_blocks = ["0.0.0.0/0"]
}
