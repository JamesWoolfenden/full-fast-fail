# fails
# CKV_AWS_120: "Ensure API Gateway caching is enabled"
# CKV_AWS_73: "Ensure API Gateway has X-Ray Tracing enabled"
# CKV_AWS_76: "Ensure API Gateway has Access Logging enabled"
# CKV2_AWS_4: "Ensure API Gateway stage have logging level defined as appropriate"
# Check: CKV2_AWS_29: "Ensure public API gateway are protected by WAF"


resource "aws_api_gateway_stage" "fail_waf" {
  deployment_id = aws_api_gateway_deployment.example.id
  stage_name    = "fail-waf"
  rest_api_id   = aws_api_gateway_rest_api.fail.id
  tags          = { test = "Fail" }
}

resource "aws_api_gateway_rest_api" "fail" {
  name = "example"
  tags = { test = "Fail" }
}

provider "aws" {
  region = "eu-west-1"
}
