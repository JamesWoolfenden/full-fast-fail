# fails
# todo not sure this even works anymore until August 2022
# Ensure that detailed monitoring is enabled for EC2 instancesCheckov CKV_AWS_126
# Ensure that EC2 is EBS optimizedCheckov CKV_AWS_135
# Ensure Instance Metadata Service Version 1 is not enabledCheckov CKV_AWS_79
# Ensure all data stored in the Launch configuration or instance Elastic Blocks Store is securely encryptedCheckov CKV_AWS_8
resource "aws_instance" "positive1" {
  ami = data.aws_ami.ubuntu.id

  instance_type = "t2.micro"
  tags          = { test = "Fail" }
}

# provider "aws" {
#   region = "us-east-1"
# }


data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  # filter {
  #   name   = "virtualization-type"
  #   values = ["hvm"]
  # }

  owners = ["099720109477"] # Canonical
}

provider "aws" {
  region = "us-east-1"
}
