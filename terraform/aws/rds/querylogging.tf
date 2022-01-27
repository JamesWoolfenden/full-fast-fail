# fails
# CKV2_AWS_8: "Ensure that RDS clusters has backup plan of AWS Backup"
# CKV2_AWS_27: "Ensure Postgres RDS as aws_rds_cluster has Query Logging enabled"
# CKV_AWS_96: "Ensure all data stored in Aurora is securely encrypted at rest"
# CKV_AWS_162: "Ensure RDS cluster has IAM authentication enabled"
# CKV_AWS_139: "Ensure that RDS clusters have deletion protection enabled"
# CKV_AWS_133: "Ensure that RDS instances has backup policy"
# CKV_AWS_128: "Ensure that an Amazon RDS Clusters have AWS Identity and Access Management (IAM) authentication enabled"
resource "aws_rds_cluster" "fail" {
  cluster_identifier              = "aurora-cluster-demo"
  engine                          = "aurora-postgresql"
  availability_zones              = ["us-west-2a", "us-west-2b", "us-west-2c"]
  database_name                   = "mydb"
  master_username                 = "foo"
  master_password                 = "bar"
  backup_retention_period         = 0
  preferred_backup_window         = "07:00-09:00"
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.fail.name
}

//not correct params
resource "aws_rds_cluster_parameter_group" "fail" {
  name        = "mysql-cluster-fail"
  family      = "mysql"
  description = "RDS default cluster parameter group"

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8"
  }
}
