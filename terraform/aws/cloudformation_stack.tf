resource "aws_cloudformation_stack" "default" {
  name = "networking-stack"

  parameters = {
    VPCCidr = "10.0.0.0/16"
  }
}
