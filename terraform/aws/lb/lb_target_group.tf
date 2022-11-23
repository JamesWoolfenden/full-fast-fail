# fail
# healthcheck is defined -  if matcher or path are set


resource "aws_lb_target_group" "fail" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
  health_check {
    enabled = false # trigger- defaults to true
  }
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}
