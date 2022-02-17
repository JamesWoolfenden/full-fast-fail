#this is a problematic code where the query should report a result(s)
resource "aws_iam_access_key" "fail_key" {
  user    = "root"
  pgp_key = "keybase:some_person_that_exists"
  tags    = { test = "Fail" }
}

resource "aws_iam_user" "fail_key" {
  name = "loadbalancer"
  path = "/system/"
  tags = { test = "Fail" }
}

resource "aws_iam_user_policy" "fail_key" {
  name = "test"
  user = aws_iam_user.fail_key.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
  tags   = { test = "Fail" }
}
