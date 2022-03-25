# fail
# Ensure that RDS instances has backup policyCheckov CKV_AWS_133
# Ensure that respective logs of Amazon Relational Database Service (Amazon RDS) are enabledCheckov CKV_AWS_129
# Ensure all data stored in the RDS is securely encrypted at restCheckov CKV_AWS_16
# Ensure that enhanced monitoring is enabled for Amazon RDS instancesCheckov CKV_AWS_118
# Ensure RDS database has IAM authentication enabledCheckov CKV_AWS_161
# Ensure that RDS instances have Multi-AZ enabledCheckov CKV_AWS_157
# Ensure all data stored in RDS is not publicly accessibleCheckov CKV_AWS_17
# Ensure Postgres RDS as aws_db_instance has Query Logging enabledCheckov CKV2_AWS_30
# Ensure DB instance gets all minor upgrades automaticallyCheckov (CKV_AWS_226)
# tfsec
# AWS011 Resource 'aws_db_instance.fail' is exposed publicly.
# AWS052 Resource 'aws_db_instance.fail' has no storage encryption defined.
# AWS091 Resource 'aws_db_instance.fail' has backup retention period set to a low value

resource "aws_db_instance" "fail" {
  //storage_encrypted  = true
  publicly_accessible        = true
  backup_retention_period    = 0
  engine                     = "postgres"
  auto_minor_version_upgrade = false
  tags                       = { test = "Fail" }
}
