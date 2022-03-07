# fails
# Ensure the ELBv2 (Application/Network) has access logging enabledCheckov CKV_AWS_91
# Ensure that Load Balancer has deletion protection enabledCheckov CKV_AWS_150
# Ensure that ALB drops HTTP headersCheckov CKV_AWS_131
resource "aws_lb" "test" {
  name               = "test"
  load_balancer_type = "application"
  subnets            = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
  internal           = true
  tags               = { test = "fail" }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
    test = "fails"
  }
}


resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "no_lb"
    test = "fails"
  }
}


resource "aws_subnet" "subnet1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-west-2a"
  tags = {
    Name = "no_lb"
    test = "fails"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "eu-west-2b"
  tags = {
    Name = "no_lb"
    test = "fails"
  }
}

provider "aws" {
  region = "eu-west-2"
}
