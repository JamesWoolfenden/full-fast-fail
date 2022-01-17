# fail
# CKV_AWS_157: "Ensure that RDS instances have Multi-AZ enabled"
# CKV_AWS_129: "Ensure that respective logs of Amazon Relational Database Service (Amazon RDS) are enabled"
# CKV_AWS_17: "Ensure all data stored in RDS is not publicly accessible"
# CKV_AWS_118: "Ensure that enhanced monitoring is enabled for Amazon RDS instances"
# CKV_AWS_16: "Ensure all data stored in the RDS is securely encrypted at rest"
# CKV_AWS_133: "Ensure that RDS instances has backup policy"
# CKV2_AWS_30: "Ensure Postgres RDS as aws_db_instance has Query Logging enabled"

# tfsec
# AWS011 Resource 'aws_db_instance.fail' is exposed publicly.
# AWS052 Resource 'aws_db_instance.fail' has no storage encryption defined.
# AWS091 Resource 'aws_db_instance.fail' has backup retention period set to a low value

resource "aws_db_instance" "fail" {
  //storage_encrypted  = true
  publicly_accessible     = true
  backup_retention_period = 0
  engine="postgres"
}
