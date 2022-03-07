# fails
# todo ensure no unused certificates
# CKV_AWS_233 - create before destroy
# CKV_AWS_234 ensure you using certificate transparency logging preference

resource "aws_acm_certificate" "cert" {
  domain_name       = "example.com"
  validation_method = "DNS"

  tags = {
    Environment = "test"
  }
  options {
    certificate_transparency_logging_preference = "DISABLED"
  }
  #   lifecycle {
  #     create_before_destroy = true
  #   }
}
