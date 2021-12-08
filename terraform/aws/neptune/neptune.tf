#fail

# CKV_AWS_101: "Ensure Neptune logging is enabled"
# CKV_AWS_44: "Ensure Neptune storage is securely encrypted"

# tfsec
# Resource 'aws_neptune_cluster.default' uses default value for enable_cloudwatch_logs_exports
# Resource 'aws_neptune_cluster.default' does not have storage_encrypted set to true

resource "aws_neptune_cluster" "default" {
  cluster_identifier                  = var.neptune-dbname
  engine                              = "neptune"
  backup_retention_period             = 5
  preferred_backup_window             = "07:00-09:00"
  skip_final_snapshot                 = true
  iam_database_authentication_enabled = false
  apply_immediately                   = true
  storage_encrypted                   = false
  # enable_cloudwatch_logs_exports = false
}
