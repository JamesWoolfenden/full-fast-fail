# fail
# CKV_AWS_65: "Ensure container insights are enabled on ECS cluster"
# todo execute_command_configuration/kms_key_id
# todo log_configuration/cloud_watch_encryption_enabled
# todo s3_bucket_encryption_enabled is set
# todo cloud_watch_log_group_name is set
# todo logging is not NONE
# tfsec
# AWS090 Resource 'aws_ecs_cluster.my_cluster' does not have containerInsights enabled

resource "aws_ecs_cluster" "fail" {
  name = "white-hart"
  tags = { test = "fail" }
}
