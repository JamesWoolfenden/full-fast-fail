resource "aws_security_group" "fail" {
  name_prefix   = "hot-stuff"
  vpc_id = aws_vpc.web_vpc.id
  ingress {
      from_port = 22
      to_port = 22
      cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
      from_port = 3389
      to_port = 3389
      cidr_blocks = ["0.0.0.0/0"]
  }
  
}
