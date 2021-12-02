
resource "aws_secretsmanager_secret" "fail" {
  name = "lambda_password"
}
