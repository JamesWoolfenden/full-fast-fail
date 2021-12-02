# fail
# TODO dont mix inline rules with separate resources


resource "aws_security_group_rule" "fail" {
  security_group_id = aws_security_group.fail_sg.id
  type              = "ingress"
  cidr_blocks       = ["172.31.0.0/16"]
}

resource "aws_security_group" "fail_sg" {
  ingress {
    cidr_blocks = ["10.0.0.0/16"]
  }
}
