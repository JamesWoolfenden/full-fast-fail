# fail
# CKV2_AWS_22: "Ensure an IAM User does not have access to the console"
resource "aws_iam_user" "fail" {
  name = "human-user"
}

resource "aws_iam_user_login_profile" "fail" {
  user    = aws_iam_user.fail.name
  pgp_key = "keybase:human-user"
}
