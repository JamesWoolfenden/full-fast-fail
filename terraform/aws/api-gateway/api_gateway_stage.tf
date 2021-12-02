# fail
# aws_api_gateway_stage
# CKV2_AWS_29: "Ensure public API gateway are protected by WAF"
# CKV_AWS_76: "Ensure API Gateway has Access Logging enabled"
# CKV_AWS_120: "Ensure API Gateway caching is enabled"
# CKV_AWS_73: "Ensure API Gateway has X-Ray Tracing enabled"
# CKV2_AWS_4: "Ensure API Gateway stage have logging level defined as appropriate"


# tfsec
# AWS061 -aws_apigateway_stage.fail is missing access log settings block

resource "aws_api_gateway_stage" "fail" {
  deployment_id        = aws_api_gateway_deployment.example.id
  rest_api_id          = aws_api_gateway_rest_api.example.id
  stage_name           = "example"
  xray_tracing_enabled = false
}
