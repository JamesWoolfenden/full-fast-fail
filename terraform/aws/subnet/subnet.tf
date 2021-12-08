# fails
# CKV_AWS_130: "Ensure VPC subnets do not assign public IP by default"

resource "aws_subnet" "test" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  map_public_ip_on_launch = true
}
