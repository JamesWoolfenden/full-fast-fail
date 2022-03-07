# fails
# todo mfa delete is not set? not sure this is a good policy
resource "aws_s3_bucket" "fail_mfa" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
