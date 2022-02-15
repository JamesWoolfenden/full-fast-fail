resource "aws_iam_user" "fail_mfa" {
  name = "root"
  path = "/system/"

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_access_key" "fail_mfa" {
  user = aws_iam_user.fail_mfa.name
}

resource "aws_iam_user_policy" "fail_mfa" {
  name = "test"
  user = aws_iam_user.fail_mfa.name

  policy = <<EOF
{
   "Version": "2012-10-17",
   "Statement": [
     {
       "Effect": "Allow",
       "Principal": {
         "AWS": "arn:aws:iam::111122223333:root"
       },
       "Action": "sts:AssumeRole"
     }
   ]
}
EOF
}
