# fails
# CKV2_AWS_11: "Ensure VPC flow logging is enabled in all VPCs"
# CKV2_AWS_12: "Ensure the default security group of every VPC restricts all traffic"
# todo check vpc connected to network firewall
resource "aws_vpc" "eks_vpc" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags                 = { test = "Fail" }
}
