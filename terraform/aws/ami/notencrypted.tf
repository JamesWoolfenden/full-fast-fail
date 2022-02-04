# Fails
# CKV_AWS_204: "Ensure AMIs are encrypted using KMS CMKs"
resource "aws_ami" "fail" {
  name                = "terraform-example"
  virtualization_type = "hvm"
  root_device_name    = "/dev/xvda"

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = 8
  }
}

provider "aws" {
  region="eu-west-2"
}