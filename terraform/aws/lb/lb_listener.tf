# fail
# CKV_AWS_150: "Ensure that Load Balancer has deletion protection enabled"
# CKV_AWS_91: "Ensure the ELBv2 (Application/Network) has access logging enabled"
# CKV_AWS_131: "Ensure that ALB drops HTTP headers"
# CKV_AWS_2: "Ensure ALB protocol is HTTPS"
# CKV_AWS_103: "Ensure that load balancer is using TLS 1.2"
# CKV2_AWS_20: "Ensure that ALB redirects HTTP requests into HTTPS ones"
# CKV2_AWS_28: "Ensure public facing ALB are protected by WAF"

# kics
# ALB Listening on HTTP default_action.redirect.protocol' is equal to 'HTTPS'

resource "aws_lb" "lb_bad_1" {
  tags = { test = "Fail" }
}

resource "aws_lb_listener" "listener_bad_1" {
  load_balancer_arn = aws_lb.lb_bad_1.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "some-action"
    # redirect {
    #   protocol = "HTTPS"
    # }

  }
  tags = { test = "Fail" }
}
