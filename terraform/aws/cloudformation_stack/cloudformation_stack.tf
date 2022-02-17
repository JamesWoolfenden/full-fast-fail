# fail
# CKV_AWS_124: "Ensure that CloudFormation stacks are sending event notifications to an SNS topic"

resource "aws_cloudformation_stack_set" "example" {
  name = "examplea"


  parameters = {
    VPCCidr = "10.0.0.0/16"
  }

  template_body = <<TEMPLATE
{
  "Parameters" : {
    "VPCCidr" : {
      "Type" : "String",
      "Default" : "10.0.0.0/16",
      "Description" : "Enter the CIDR block for the VPC. Default is 10.0.0.0/16."
    }
  },
  "Resources" : {
    "myVpc": {
      "Type" : "AWS::EC2::VPC",
      "Properties" : {
        "CidrBlock" : { "Ref" : "VPCCidr" },
        "Tags" : [
          {"Key": "Name", "Value": "Primary_CF_VPC"}
        ]
      }
    }
  }
}
TEMPLATE
  tags          = { test = "Fail" }
}

provider "aws" {
  region = "eu-west-1"
}
