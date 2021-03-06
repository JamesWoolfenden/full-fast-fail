# fails
# todo policy is to permissive
# todo copy of CKV2_AWS_36 but for secrets
provider "aws" {
  region = "us-east-1"
}

resource "aws_secretsmanager_secret" "not_secure_policy" {
  name = "not_secure_secret"
  tags = { test = "Fail" }
}

resource "aws_secretsmanager_secret_policy" "example" {
  secret_arn = aws_secretsmanager_secret.not_secure_policy.arn

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "EnableAllPermissions",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "secretsmanager:*",
      "Resource": "*"
    }
  ]
}
POLICY
  tags   = { test = "Fail" }
}
