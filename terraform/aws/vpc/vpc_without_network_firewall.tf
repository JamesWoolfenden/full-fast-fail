# fails
# todo
# todo deletion protection for net firewall is enabled
resource "aws_vpc" "positive" {
  cidr_block = "10.0.0.0/16"
    tags = {
    "key" = "value"
  }
}
