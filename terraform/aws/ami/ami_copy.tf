# fails
# CKV_AWS_235 encrypted =true - defaults to false
# CKV_AWS_236 kms_key_id is set

resource "aws_ami_copy" "example" {
  name              = "terraform-example"
  description       = "A copy of ami-xxxxxxxx"
  source_ami_id     = "ami-xxxxxxxx"
  source_ami_region = "us-west-1"
  encrypted = false #default is false
  tags = {
    Name = "HelloWorld"
    test = "failed"
  }
}
