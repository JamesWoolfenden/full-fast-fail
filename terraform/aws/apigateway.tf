# fails
# CKV_AWS_120: "Ensure API Gateway caching is enabled"
# CKV_AWS_73: "Ensure API Gateway has X-Ray Tracing enabled"
# CKV_AWS_76: "Ensure API Gateway has Access Logging enabled"
# CKV2_AWS_4: "Ensure API Gateway stage have logging level defined as appropriate"

#ToDo
# Check: CKV2_AWS_29: "Ensure public API gateway are protected by WAF"
#         PASSED for resource: aws_api_gateway_stage.fail
#         File: /apigateway.tf:3-5
#         Guide: https://docs.bridgecrew.io/docs/ensure-public-api-gateway-are-protected-by-waf

resource "aws_api_gateway_stage" "fail" {
  name = "example"
}

resource "aws_api_gateway_rest_api" "fail" {
  name = "example"
}
