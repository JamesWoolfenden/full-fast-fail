# fail
# CKV_SECRET_6: "Base64 High Entropy String"
# CKV2_AWS_13: "Ensure that Redshift clusters has backup plan of AWS Backup"
# CKV_AWS_141: "Ensured that redshift cluster allowing version upgrade by default"
# CKV_AWS_188: "Ensure RedShift Cluster is encrypted by KMS using a customer managed Key (CMK)"
# CKV_AWS_142: "Ensure that Redshift cluster is encrypted by KMS"
# CKV_AWS_87: "Redshift cluster should not be publicly accessible"
# CKV_AWS_71: "Ensure Redshift Cluster logging is enabled"
# CKV_AWS_154: "Ensure Redshift is not deployed outside of a VPC"
# CKV_AWS_64: "Ensure all data stored in the Redshift cluster is securely encrypted at rest"

# tfsec
# AWS094 Resource 'aws_redshift_cluster.fail' does not have encryption enabled
# GEN003 block 'aws_redshift_cluster.fail' includes a potentially sensitive attribute which is defined within the project.

resource "aws_redshift_cluster" "fail" {
  cluster_identifier                  = "examplea"
  availability_zone                   = data.aws_availability_zones.available.names[0]
  database_name                       = "mydb"
  master_username                     = "foo_test"
  master_password                     = "Mustbe8characters"
  node_type                           = "dc2.large"
  automated_snapshot_retention_period = 0
  allow_version_upgrade               = false
  skip_final_snapshot                 = true
  kms_key_id                          = ""
  cluster_subnet_group_name           = ""
  tags                                = { test = "Fail" }
}
