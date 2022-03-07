# fails
# todo default sg Default Security Group attached to every VPC should restrict all traffic egress or ingress
resource "aws_vpc" "mainvpc" {
  cidr_block = "10.1.0.0/16"
  tags       = { test = "fail" }
}

resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.mainvpc.id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }


  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
  }

  tags = { test = "fail" }
}

# resource "aws_default_security_group" "default2" {
#   vpc_id = aws_vpc.mainvpc.id

#   ingress = [{
#     protocol         = -1
#     self             = true
#     from_port        = 0
#     to_port          = 0
#     cidr_blocks      = [""]
#     description      = ""
#     ipv6_cidr_blocks = [""]
#     security_groups  = [""]
#     prefix_list_ids  = [""]
#   }]


#   egress = [{
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = [""]
#     description      = ""
#     ipv6_cidr_blocks = [""]
#     self             = false
#     security_groups  = [""]
#     prefix_list_ids  = [""]
#   }]

#   tags = { test = "fail" }
# }

provider "aws" {
  region = "eu-west-2"
}
