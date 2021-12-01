# fail
# CKV_AWS_76: "Ensure API Gateway has Access Logging enabled"

# tfsec
# AWS061 -aws_apigatewayv2_stage.fail is missing access log settings block

resource "aws_apigatewayv2_stage" "fail" {
  api_id = aws_apigatewayv2_api.example.id
  name   = "example-stage"
}
