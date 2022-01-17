# fails
# CKV2_AWS_11: "Ensure VPC flow logging is enabled in all VPCs"
# CKV2_AWS_1: "Ensure that all NACL are attached to subnets"
# CKV2_AWS_12: "Ensure the default security group of every VPC restricts all traffic"
resource "aws_vpc" "bad_vpc" {
  cidr_block = "10.0.0.0/16"
}


resource "aws_network_acl" "acl_bad_A" {
  vpc_id = aws_vpc.bad_vpc.id
}
