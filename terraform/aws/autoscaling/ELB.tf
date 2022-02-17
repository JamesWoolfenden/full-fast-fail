# fail
# CKV_AWS_92: "Ensure the ELB has access logging enabled"
# CKV_AWS_127: "Ensure that Elastic Load Balancer(s) uses SSL certificates provided by AWS Certificate Manager"
# CKV_AWS_138: "Ensure that ELB is cross-zone-load-balancing enabled"
# CKV_AWS_153: "Autoscaling groups should supply tags to launch configurations"
# CKV2_AWS_15: "Ensure that auto Scaling groups that are associated with a load balancer, are using Elastic Load Balancing health checks."
# todo aws-elbv2-alb-not-public ?
# tfsec
# aws-elbv2-alb-not-public
resource "aws_autoscaling_group" "autoscalling_bad" {
  max_size                  = 5
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 4
  force_delete              = true

  lifecycle {
    ignore_changes = [load_balancers, target_group_arns]
  }
  tags = { test = "Fail" }
}

resource "aws_autoscaling_attachment" "test_bad_attachment" {
  autoscaling_group_name = aws_autoscaling_group.autoscalling_bad.id
  elb                    = aws_elb.test_bad.id
}

resource "aws_elb" "test_bad" {
  name               = "foobar-terraform-elb"
  availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  listener {
    instance_port      = 8000
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = "arn:aws:iam::123456789012:server-certificate/certName"
  }

  instances                   = [aws_instance.foo.id]
  cross_zone_load_balancing   = false
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "foobar-terraform-elb"
    test = "fail"
  }
}
