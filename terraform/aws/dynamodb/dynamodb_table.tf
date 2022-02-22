# fail
# CKV2_AWS_16: "Ensure that Auto Scaling is enabled on your DynamoDB tables"
# CKV_AWS_119: "Ensure DynamoDB Tables are encrypted using a KMS Customer Managed CMK"
# CKV_AWS_28: "Ensure Dynamodb point in time recovery (backup) is enabled"
# todo - add check so that - use lifecycle ignore_changes for read_capacity and/or write_capacity if there's autoscaling policy attached to the table.
# tfsec
# AWS092 Resource 'aws_dynamodb_table.default' is not using KMS CMK for encryption
# AWS086 Resource 'aws_dynamodb_table.default' doesn't have point in time recovery

resource "aws_dynamodb_table" "default" {
  name           = "GameScores"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "UserId"
  range_key      = "UserId"

  attribute {
    name = "UserId"
    type = "S"
  }

  replica {
    region_name = "us-east-2"
  }

  replica {
    region_name = "us-west-2"
  }

  # server_side_encryption {
  # 	enabled     = true
  # 	kms_key_arn = aws_kms_key.dynamo_db_kms.key_id
  # }
  tags = { test = "Fail" }
}
