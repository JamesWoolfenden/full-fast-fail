resource "aws_cloudwatch_log_group" "logs" {
  name              = var.log_group_name
  tags              = var.common_tags
}

