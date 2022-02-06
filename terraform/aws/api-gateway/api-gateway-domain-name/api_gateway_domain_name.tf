# fail
# todo check policy is at least TLS_1_2
# tfsec
# Resource 'aws_api_gateway_domain_name.fail' defines outdated SSL/TLS policies (not using TLS_1_2).

resource "aws_api_gateway_domain_name" "fail" {
  security_policy = "TLS_1_0"
  domain_name     = "FreeBeer"
}
