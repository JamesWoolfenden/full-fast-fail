# fail

# CKV_AWS_150: "Ensure that Load Balancer has deletion protection enabled"
# CKV_AWS_91: "Ensure the ELBv2 (Application/Network) has access logging enabled"
# CKV_AWS_131: "Ensure that ALB drops HTTP headers"
# CKV2_AWS_28: "Ensure public facing ALB are protected by WAF"

# ToDo
# CKV2_AWS_20: "Ensure that ALB redirects HTTP requests into HTTPS ones"


resource "aws_alb" "disabled" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids
}
