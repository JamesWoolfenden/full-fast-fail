# fails
# todo

# Resource 'aws_lambda_permission.fail' missing source ARN but has *.amazonaws.com Principal.

resource "aws_lambda_permission" "fail" {
  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.func.function_name
  principal     = "sns.amazonaws.com"
}
