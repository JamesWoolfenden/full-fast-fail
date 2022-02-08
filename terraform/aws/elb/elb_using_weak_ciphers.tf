# fails
# todo
resource "aws_elb" "fail" {
  name               = "wu-tang"
  availability_zones = ["us-east-1a"]

  listener {
    instance_port      = 443
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = "arn:aws:iam::000000000000:server-certificate/wu-tang.net"
  }

  tags = {
    Name = "wu-tang"
  }
}

resource "aws_load_balancer_policy" "positive2" {
  load_balancer_name = aws_elb.fail.name
  policy_name        = "wu-tang-ca-pubkey-policy"
  policy_type_name   = "PublicKeyPolicyType"

  policy_attribute {
    name  = "PublicKey"
    value = file("wu-tang-pubkey")
  }
}

resource "aws_load_balancer_policy" "positive3" {
  load_balancer_name = aws_elb.wu-tang.name
  policy_name        = "wu-tang-root-ca-backend-auth-policy"
  policy_type_name   = "BackendServerAuthenticationPolicyType"

  policy_attribute {
    name  = "PublicKeyPolicyName"
    value = aws_load_balancer_policy.wu-tang-root-ca-pubkey-policy.policy_name
  }
}
