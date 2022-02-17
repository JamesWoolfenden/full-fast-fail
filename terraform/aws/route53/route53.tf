# fail
# CKV2_AWS_23: "Route53 A Record has Attached Resource"
resource "aws_route53_record" "fail" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = "dns.freebeer.site"
  type    = "A"
  ttl     = "300"
  records = ["1.1.1.1"]
  tags    = { test = "Fail" }
}
