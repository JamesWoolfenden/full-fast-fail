# fail
# CKV_AWS_206: "Ensure API Gateway Domain uses a modern security Policy"
# tfsec
# Resource 'aws_api_gateway_domain_name.fail' defines outdated SSL/TLS policies (not using TLS_1_2).

resource "aws_api_gateway_domain_name" "fail" {
  security_policy = "TLS_1_0"
  domain_name     = "FreeBeer"
  tags            = { test = "Fail" }
}
