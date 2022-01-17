#fails
#CKV_AWS_92: "Ensure the ELB has access logging enabled"
#CKV_AWS_138: "Ensure that ELB is cross-zone-load-balancing enabled"
#CKV_AWS_127: "Ensure that Elastic Load Balancer(s) uses SSL certificates provided by AWS Certificate Manager"
resource "aws_elb" "test" {
  name                      = "test-lb-tf"
  availability_zones        = ["us-west-2a", "us-west-2b", "us-west-2c"]
  cross_zone_load_balancing = false
  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
}
