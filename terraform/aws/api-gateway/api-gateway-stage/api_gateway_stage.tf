# fails
# CKV_AWS_120: "Ensure API Gateway caching is enabled"
# CKV_AWS_73: "Ensure API Gateway has X-Ray Tracing enabled"
# CKV_AWS_76: "Ensure API Gateway has Access Logging enabled"
# CKV2_AWS_4: "Ensure API Gateway stage have logging level defined as appropriate"
# CKV2_AWS_29: "Ensure public API gateway are protected by WAF"
# todo client_certificate_id
resource "aws_api_gateway_stage" "fail" {
  stage_name    = "prod"
  rest_api_id   = aws_api_gateway_rest_api.fail.id
  deployment_id = aws_api_gateway_deployment.fail.id
  #   client_certificate_id = "12131323"
  tags = { test = "Fail" }
}
