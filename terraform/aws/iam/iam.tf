
# fail
# CKV_AWS_40

resource "aws_iam_policy_attachment" "fail" {
  name       = "example"
  policy_arn = aws_iam_policy.policy.arn

  users = ["example"]
}

resource "aws_iam_user_policy" "fail" {
  user = "example"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_user_policy_attachment" "fail" {
  user       = "example"
  policy_arn = aws_iam_policy.policy.arn
}
