resource "aws_ebs_volume" "fail" {
  availability_zone = "eu-west-1a"
  size              = 1
}
