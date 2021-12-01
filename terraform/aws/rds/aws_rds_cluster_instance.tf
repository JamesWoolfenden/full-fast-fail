
resource "aws_rds_cluster_instance" "fail" {
  name                 = "bar"
  performance_insights_enabled = false
  performance_insights_kms_key_id = ""
  kms_key_id=""
}
