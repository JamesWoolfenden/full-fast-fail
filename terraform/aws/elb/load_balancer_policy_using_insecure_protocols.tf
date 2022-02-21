# fail
# CKV_AWS_213 Ensure ELB Policy uses only secure protocols
# todo elb should use vpc- subnets (not availability zones)
resource "aws_elb" "wu_tang" {
  name = "wu-tang"

  subnets = ["subnet-08d97e381dbc80d40", "subnet-03fdfb13a135366a7"]
  listener {
    instance_port      = 443
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = "arn:aws:iam::000000000000:server-certificate/wu-tang.net"
  }

  tags = {
    Name = "wu-tang"
    test = "fails"
  }
}

resource "aws_load_balancer_policy" "fail2" {
  load_balancer_name = aws_elb.wu-tang.name
  policy_name        = "wu-tang-ssl"
  policy_type_name   = "SSLNegotiationPolicyType"

  policy_attribute {
    name  = "Protocol-TLSv1.2"
    value = "true"
  }

  policy_attribute {
    name  = "Protocol-TLSv1"
    value = "true"
  }
  tags = { test = "Fail" }
}


provider "aws" {
  region = "eu-west-2"
}
