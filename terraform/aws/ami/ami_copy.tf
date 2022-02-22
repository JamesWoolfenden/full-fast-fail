# fails
# todo encrypted =true - defaults to false
# kms_key_id is set

resource "aws_ami_copy" "example" {
  name              = "terraform-example"
  description       = "A copy of ami-xxxxxxxx"
  source_ami_id     = "ami-xxxxxxxx"
  source_ami_region = "us-west-1"

  tags = {
    Name = "HelloWorld"
    test = "failed"
  }
}
