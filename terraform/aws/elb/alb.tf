# fail
# CKV_AWS_150: "Ensure that Load Balancer has deletion protection enabled"
# CKV_AWS_91: "Ensure the ELBv2 (Application/Network) has access logging enabled"
# CKV_AWS_131: "Ensure that ALB drops HTTP headers"
# CKV2_AWS_28: "Ensure public facing ALB are protected by WAF"

# todo investigate CKV2_AWS_20: "Ensure that ALB redirects HTTP requests into HTTPS ones" - passing?
# tfsec
# AWS005 Resource 'aws_alb.fail' is exposed publicly
# AWS083 Resource 'aws_alb.fail' sets the drop_invalid_header_fields to false

resource "aws_alb" "fail" {
  name               = "bad_alb"
  internal           = false
  load_balancer_type = "application"

  # access_logs {
  #   bucket  = aws_s3_bucket.lb_logs.bucket
  #   prefix  = "test-lb"
  #   enabled = true
  # }

  drop_invalid_header_fields = false
    tags = {
    "key" = "value"
  }
}
