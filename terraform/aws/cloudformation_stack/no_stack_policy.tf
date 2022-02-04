# fails
# CKV_AWS_124: "Ensure that CloudFormation stacks are sending event notifications to an SNS topic"

# kics
# todo policy body or url is set
resource "aws_cloudformation_stack" "positive1" {

  name = "networking-stack"

  parameters = {
    VPCCidr = "10.0.0.0/16"
  }
  # policy_body = "somepolicy"
  # policy_url = "somepolicyurl"
}
