#fails
# todo retention_period default 7  7-35 like CKV_AWS_133
resource "aws_db_instance_automated_backups_replication" "default" {
  source_db_instance_arn = "arn:aws:rds:us-west-2:123456789012:db:mydatabase"
  retention_period       = 14
}
