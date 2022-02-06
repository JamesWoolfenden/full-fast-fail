# fail
# CKV_AWS_76: "Ensure API Gateway has Access Logging enabled"
# CKV2_AWS_29: "Ensure public API gateway are protected by WAF"
# CKV2_AWS_4: "Ensure API Gateway stage have logging level defined as appropriate"
# CKV_AWS_73: "Ensure API Gateway has X-Ray Tracing enabled"
# CKV_AWS_120: "Ensure API Gateway caching is enabled"

# tfsec
# AWS061 -aws_apigatewayv2_stage.fail is missing access log settings block

resource "aws_apigatewayv2_stage" "fail" {
  api_id = aws_apigatewayv2_api.example.id
  name   = "example-stage"
}

resource "aws_apigatewayv2_api" "example" {
  protocol_type = "HTTP"
  name          = var.name

  #   access_log_settings {
  #   destination_arn = "dest"
  # }
}
