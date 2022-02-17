locals {
  region                   = "us-east-1"
  cidr_block               = "172.16.0.0/16"
  public_subnet_cidr_block = "172.16.100.0/24"
  quad_zero_cidr_block     = "0.0.0.0/0"
}

provider "aws" {
  region = local.region
}

resource "aws_vpc" "main" {
  cidr_block           = local.cidr_block
  enable_dns_support   = false
  enable_dns_hostnames = false
  tags                 = { test = "fail" }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = local.public_subnet_cidr_block

  tags = {
    Name = "public-subnet"
    test = "fail"
  }
}

resource "aws_route_table" "public_rtb" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block      = local.cidr_block
    vpc_endpoint_id = aws_vpc_endpoint.sqs_vpc_endpoint.id
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-rtb"
    test = "fails"
  }
}

resource "aws_route_table_association" "public_rtb_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rtb.id
}

resource "aws_security_group" "public_internet_sg" {
  name        = "public-internet-sg"
  description = "Allow all local traffic with internet access"
  vpc_id      = aws_vpc.main.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [local.quad_zero_cidr_block]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [local.cidr_block]
  }
  tags = { test = "fail" }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "test_ec2_instance" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.public_internet_sg.id]
  tags                   = { test = "fail" }
}

resource "aws_vpc_endpoint" "sqs_vpc_endpoint" {
  vpc_id              = aws_vpc.main.id
  service_name        = "com.amazonaws.${local.region}.sqs"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  subnet_ids          = [aws_subnet.public_subnet.id]
  security_group_ids  = [aws_security_group.public_internet_sg.id]
  tags                = { test = "fail" }
}

resource "aws_sqs_queue" "test_queue" {
  name = "test-queue"
  tags = { test = "Fail" }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags   = { test = "fail" }
}
