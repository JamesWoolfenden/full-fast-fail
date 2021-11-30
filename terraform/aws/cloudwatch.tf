# fails
# CKV_AWS_66: "Ensure that CloudWatch Log Group specifies retention days"
# CKV_AWS_158: "Ensure that CloudWatch Log Group is encrypted by KMS"

resource "aws_cloudwatch_log_group" "logs" {
  name = var.log_group_name
  tags = var.common_tags
}

variable "log_group_name" {
  default = "MyLogGroupName"
}

variable "common_tags" {
  type = map(string)
  default = {
    automatedby = "JamesWoolfenden"
  }
}
