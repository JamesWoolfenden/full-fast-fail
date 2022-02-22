# fails
# todo
# CKV2_AWS_1: "Ensure that all NACL are attached to subnets"
# todo acl unrestricted access to ssh
# todo acl unrestricted access to rdp


# tfsec
# AWS049 Resource 'aws_network_acl_rule.fail' defines a Network ACL rule that allows specific ingress ports from anywhere.
# AWS050 Resource 'aws_network_acl_rule.fail' defines a fully open ingress Network ACL rule with ALL ports open.

resource "aws_network_acl" "fail_ssh" {
  vpc_id = aws_vpc.main.id

  egress = [
    {
      protocol   = "tcp"
      rule_no    = 200
      action     = "allow"
      cidr_block = "10.3.0.0/18"
      from_port  = 443
      to_port    = 443
    }
  ]

  ingress = [
    {
      protocol   = "tcp"
      rule_no    = 100
      action     = "allow"
      cidr_block = "0.0.0.0/0"
      from_port  = 22
      to_port    = 22
    },
    {
      protocol   = "tcp"
      rule_no    = 110
      action     = "allow"
      cidr_block = "0.0.0.0/0"
      from_port  = 3389
      to_port    = 3389
    }
  ]

  tags = {
    Name = "main"
    test = "fail"
  }
}
