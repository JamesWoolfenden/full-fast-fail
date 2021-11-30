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
