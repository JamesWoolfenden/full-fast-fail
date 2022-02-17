provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "mfa" {
  name = "aws-foundations-benchmark-1-4-0-terraform-user"
  path = "/"
  tags = { test = "Fail" }
}

resource "aws_iam_user_login_profile" "mfa" {
  user    = aws_iam_user.mfa.name
  pgp_key = "gpgkeybase64gpgkeybase64gpgkeybase64gpgkeybase64"
}

resource "aws_iam_access_key" "mfa" {
  user = aws_iam_user.mfa.name
  tags = { test = "Fail" }
}

resource "aws_iam_user_policy" "mfa" {
  name_prefix = "aws-foundations-benchmark-1-4-0"
  user        = aws_iam_user.mfa.name

  policy = <<EOF
{
   "Version": "2012-10-17",
   "Statement": [
     {
       "Effect": "Allow",
       "Resource": "${aws_iam_user.mfa.arn}",
       "Action": "sts:AssumeRole",
       "Condition": {
         "BoolIfExists": {
           "aws:MultiFactorAuthPresent" : "false"
         }
       }
     }
   ]
}
EOF
  tags   = { test = "Fail" }
}
