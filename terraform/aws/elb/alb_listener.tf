# fail
# CKV_AWS_2: "Ensure ALB protocol is HTTPS"
# CKV_AWS_103: "Ensure that load balancer is using TLS 1.2"

# tfsec
# AWS004 Resource 'aws_alb_listener.fail' uses plain HTTP instead of HTTPS.

resource "aws_alb_listener" "fail" {
  protocol = "HTTP"
  tags = {
    "key" = "value"
  }
}
