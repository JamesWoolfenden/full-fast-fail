# fails
# CKV_AWS_140
resource "aws_rds_global_cluster" "example" {
  global_cluster_identifier = "example"
  tags                      = { test = "Fail" }
}
