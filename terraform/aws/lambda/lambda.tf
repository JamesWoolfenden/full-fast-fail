# fails
# CKV_AWS_50: "X-ray tracing is enabled for Lambda"
# CKV_AWS_117: "Ensure that AWS Lambda function is configured inside a VPC"
# CKV_AWS_116: "Ensure that AWS Lambda function is configured for a Dead Letter Queue(DLQ)"
# CKV_AWS_173: "Check encryption settings for Lambda environmental variable"
# CKV_AWS_45: "Ensure no hard-coded secrets exist in lambda environment"
# CKV_AWS_115: "Ensure that AWS Lambda function is configured for function-level concurrent execution limit"
# CKV_SECRET_6: "Base64 High Entropy String"

# tfsec
# Resource 'aws_lambda_function.morefail' uses default value for tracing_config.mode

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
