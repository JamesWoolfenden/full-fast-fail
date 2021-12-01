#fails
# CKV_AWS_77: "Ensure Athena Database is encrypted at rest (default is unencrypted)"

# tfsec
# AWS059 Resource 'aws_athena_database.fail' missing encryption configuration block

resource "aws_athena_database" "fail" {
  name = "wg-non-encrypted"
}
