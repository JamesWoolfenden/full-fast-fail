# fail
# should not use
#  CKV_AWS_148: "Ensure no default VPC is planned to be provisioned"

#tfsec
# AWS082 Resource 'aws_default_vpc.default' should not exist

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
    fail = "test"
  }
}
