#fails

# CKV_AWS_128: "Ensure that an Amazon RDS Clusters have AWS Identity and Access Management (IAM) authentication enabled"
# CKV_AWS_96: "Ensure all data stored in Aurora is securely encrypted at rest"
# CKV_AWS_162: "Ensure RDS cluster has IAM authentication enabled"
# CKV_AWS_133: "Ensure that RDS instances has backup policy"
# CKV_AWS_139: "Ensure that RDS clusters have deletion protection enabled"
# CKV2_AWS_27: "Ensure Postgres RDS as aws_rds_cluster has Query Logging enabled"
# CKV2_AWS_8: "Ensure that RDS clusters has backup plan of AWS Backup"
# CKV_SECRET_6: "Base64 High Entropy String"

# tfsec
# GEN003 Block 'aws_rds_cluster.fail2' includes a potentially sensitive attribute which is defined within the project.
# AWS051 Resource 'aws_rds_cluster.fail2' defines a enabled RDS Cluster encryption but not the required encrypted_storage.
# Resource 'aws_rds_cluster.fail2' has backup retention period set to a low value

resource "aws_rds_cluster" "fail2" {
  engine                  = "aurora-postgresql"
  backup_retention_period = 0
  db_subnet_group_name    = aws_db_subnet_group.default.name
  master_username         = "james"
  master_password         = "password12345"
}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = ["subnet-08d97e381dbc80d40", "subnet-03fdfb13a135366a7"]
}
