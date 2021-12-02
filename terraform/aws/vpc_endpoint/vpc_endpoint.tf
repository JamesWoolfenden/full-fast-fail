#fail
#CKV_AWS_123: "Ensure that VPC Endpoint Service is configured for Manual Acceptance"

resource "aws_vpc_endpoint_service" "example" {
  acceptance_required        = false
  network_load_balancer_arns = [aws_lb.example.arn]
}
