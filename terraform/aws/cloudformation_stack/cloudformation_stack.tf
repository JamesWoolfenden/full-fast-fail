# fail
# CKV_AWS_124: "Ensure that CloudFormation stacks are sending event notifications to an SNS topic"

resource "aws_cloudformation_stack" "default" {
  name = "networking-stack"

  parameters = {
    VPCCidr = "10.0.0.0/16"
  }
}

provider "aws" {
  region = "eu-west-1"
}