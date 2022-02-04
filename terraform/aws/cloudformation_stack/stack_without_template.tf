# # fails
# CKV_AWS_124: "Ensure that CloudFormation stacks are sending event notifications to an SNS topic"
# kics
# todo check if template_body or template_url are set
resource "aws_cloudformation_stack" "fail" {

  name = "networking-stack"

  parameters = {
    VPCCidr = "10.0.0.0/16"
  }

}
