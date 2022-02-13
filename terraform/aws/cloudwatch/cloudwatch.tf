# fails
# CKV_AWS_66: "Ensure that CloudWatch Log Group specifies retention days"
# CKV_AWS_158: "Ensure that CloudWatch Log Group is encrypted by KMS"

# tfsec
# AWS089 Resource 'aws_cloudwatch_log_group.logs' is only using default encryption

resource "aws_cloudwatch_log_group" "logs" {
  name = var.log_group_name
}

variable "log_group_name" {
  description = "testcode"

  default = "MyLogGroupName"
}

variable "common_tags" {
  description = "testcode"

  type = map(string)
  default = {
    automatedby = "JamesWoolfenden"
  }
}
