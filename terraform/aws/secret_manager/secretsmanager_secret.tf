# fails
# CKV_AWS_149: "Ensure that Secrets Manager secret is encrypted using KMS CMK"
# todo look for associated aws_secretsmanager_secret_rotation
# todo remove unused secrets
# tfsec
# AWS095 Resource 'aws_secretsmanager_secret.fail' does not use CMK

resource "aws_secretsmanager_secret" "fail" {
  name = "lambda_password"
  tags = { test = "Fail" }
}
