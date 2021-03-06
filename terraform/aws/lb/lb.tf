# fail

# CKV_AWS_150: "Ensure that Load Balancer has deletion protection enabled"
# CKV_AWS_91: "Ensure the ELBv2 (Application/Network) has access logging enabled"
# CKV_AWS_131: "Ensure that ALB drops HTTP headers"
# CKV2_AWS_28: "Ensure public facing ALB are protected by WAF"
# CKV_AWS_152: "Ensure that Load Balancer (Network/Gateway) has cross-zone load balancing enabled"
# todo ensure enable_http is true - the default
# todo if application lb ensure security group specified


# ToDo
# CKV2_AWS_20: "Ensure that ALB redirects HTTP requests into HTTPS ones"

# kics

resource "aws_alb" "disabled" {
  internal                         = false
  load_balancer_type               = "application"
  name                             = "alb"
  subnets                          = var.public_subnet_ids
  enable_cross_zone_load_balancing = false
  # security_groups = null
  enable_http2 = false
  tags         = { test = "Fail" }
}

resource "aws_lb" "default" {
  internal           = false
  load_balancer_type = "network"
  name               = "nlb"
  subnets            = var.public_subnet_ids
  tags               = { test = "Fail" }
}

variable "public_subnet_ids" {
  default     = ["subnet_1234546"]
  type        = list(string)
  description = "(optional) describe your variable"
}
