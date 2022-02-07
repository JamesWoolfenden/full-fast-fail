# todo cert has expired
resource "aws_api_gateway_domain_name" "fail" {
  certificate_body = file("expiredCertificate.pem")
  domain_name      = "api.example.com"
}
