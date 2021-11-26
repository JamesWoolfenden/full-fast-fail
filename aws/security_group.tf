resource "aws_security_group" "fail" {
  name   = "${local.resource_prefix.value}-rds-sg"
  vpc_id = aws_vpc.web_vpc.id
  ingress {
      from_port = 22
      to_port = 22
      cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
      from_port = 22
      to_port = 3389
      cidr_blocks = ["0.0.0.0/0"]
  }
}
