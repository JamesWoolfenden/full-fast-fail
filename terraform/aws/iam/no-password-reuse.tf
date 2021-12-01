
resource "aws_iam_account_password_policy" "fail" {
  password_reuse_prevention = 1
}
