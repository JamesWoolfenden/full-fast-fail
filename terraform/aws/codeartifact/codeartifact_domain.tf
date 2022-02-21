# fails
# CKV_AWS_221 encryption_key is set
resource "aws_codeartifact_domain" "example" {
  domain = "example"
  # encryption_key =
  tags = {
    "key" = "value"
  }
}
