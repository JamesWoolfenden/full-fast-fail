# fails
# CKV_AWS_120: "Ensure API Gateway caching is enabled"
# CKV_AWS_73: "Ensure API Gateway has X-Ray Tracing enabled"
# CKV_AWS_76: "Ensure API Gateway has Access Logging enabled"
# CKV2_AWS_29: "Ensure public API gateway are protected by WAF"
# todo endpoint is not private
# todo set create before destroy to avoid service outages

# kics
# todo API Gateway Without Content Encoding
# todo API Gateway Without Configured Authorizer
resource "aws_api_gateway_rest_api" "fail" {
  name = "example"
  tags = { test = "Fail" }
}
