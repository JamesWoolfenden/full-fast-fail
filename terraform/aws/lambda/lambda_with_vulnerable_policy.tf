provider "aws" {
  region = "us-east-1"
}

resource "aws_lambda_function" "my_lambda" {
  filename      = "~/Downloads/lambda.json.zip"
  function_name = "my-lambda"
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  tags = {
    "key" = "value"
  }
}

resource "aws_iam_role" "lambda_role" {
  name_name_prefix = "lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
  tags               = { test = "Fail" }
}

resource "aws_lambda_permission" "all" {
  statement_id   = "AllowAllResources"
  action         = "lambda:*"
  function_name  = aws_lambda_function.my_lambda.function_name
  principal      = "s3.amazonaws.com"
  source_arn     = "arn:aws:s3:::delete-me-us-east-1-permissions-tests"
  source_account = "111111111111"
  qualifier      = aws_lambda_alias.my_lambda_alias.name
}


resource "aws_lambda_alias" "my_lambda_alias" {
  name             = "v1"
  description      = "a sample description"
  function_name    = aws_lambda_function.my_lambda.function_name
  function_version = "$LATEST"
}
