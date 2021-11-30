resource "aws_lambda_function" "morefail" {
  function_name = "morefail"
  role          = ""
  handler       = "index.handler"
  runtime       = "python3.9"
  environment {
    variables = {
      AWS_ACCESS_KEY_ID     = "AKIAIOSFODNN7EXAMPLE",
      AWS_SECRET_ACCESS_KEY = "MYMOSTSECRETTHING"
    }
  }
}
