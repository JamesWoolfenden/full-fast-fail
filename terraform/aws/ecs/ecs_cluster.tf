# fail
# CKV_AWS_65: "Ensure container insights are enabled on ECS cluster"
# CKV_AWS_223 ensure cluster is logging
# CKV_AWS_224 ensure cluster logging with CMK

# tfsec
# AWS090 Resource 'aws_ecs_cluster.my_cluster' does not have containerInsights enabled

resource "aws_ecs_cluster" "fail" {
  name = "white-hart"
  configuration {
    execute_command_configuration {
      # kms_key_id = aws_kms_key.example.arn
      logging = "NONE"

      log_configuration {
        # cloud_watch_encryption_enabled = true
        # cloud_watch_log_group_name     = aws_cloudwatch_log_group.example.name

        # or
        # s3_bucket_name=   and
        # s3_bucket_encryption_enabled =true
      }
    }
  }
  tags = { test = "fail" }
}
