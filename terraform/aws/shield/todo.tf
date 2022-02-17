# Fails
# todo
# check that shielded resources are shielded
# 	"aws_cloudfront_distribution",
# 	"aws_lb",
# 	"aws_globalaccelerator_accelerator",
# 	"aws_eip",
# 	"aws_route53_zone"

resource "aws_route53_zone" "positive2" {
  name = "example.com"
  tags = { test = "Fail" }
}

resource "aws_shield_protection" "positive2" {
  name         = "example"
  resource_arn = aws_route53_zone.positive.arn

  tags = {
    Environment = "Dev"
  }
}
