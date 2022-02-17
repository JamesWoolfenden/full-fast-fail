# fail
# CKV2_AWS_19: "Ensure that all EIP addresses allocated to a VPC are attached to EC2 instances"

resource "aws_eip" "solo" {
  vpc  = true
  tags = { test = "fail" }
}
