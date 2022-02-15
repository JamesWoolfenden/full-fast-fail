#fails
# CKV_AWS_60

resource "aws_iam_role" "lambdaRole" {
  namename_prefix    = "test"
  assume_role_policy = <<EOF
{
"Version": "2012-10-17",
"Statement": [
{
"Action": "sts:AssumeRole",
"Principal" : {"Service": "lambda.amazonaws.com"},
"Effect": "Allow"
},
{
"Action": "sts:AssumeRole",
"Principal" : {"AWS": "*"},
"Effect": "Allow"
},
{
"Action": "sts:AssumeRole",
"Principal" : {"Service": "events.amazonaws.com"},
"Effect": "Allow"
}
]
}

EOF
}
