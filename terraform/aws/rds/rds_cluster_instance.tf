# fail
# CKV_AWS_118: "Ensure that enhanced monitoring is enabled for Amazon RDS instances"
# CKV_AWS_17: "Ensure all data stored in RDS is not publicly accessible"
# todo if enabled is encrypted has performance_insights_kms_key_id
# CKV_AWS_226 auto_minor_version_upgrade is true
# tfsec
# AWS011 Resource 'aws_rds_cluster_instance.fail' is exposed publicly.

resource "aws_rds_cluster_instance" "fail" {
  name                         = "bar"
  performance_insights_enabled = false

  # performance_insights_kms_key_id = ""
  # kms_key_id                      = ""
  publicly_accessible        = true
  auto_minor_version_upgrade = false
  tags                       = { test = "Fail" }
}
