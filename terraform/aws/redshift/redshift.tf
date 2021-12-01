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
  kms_key_id = ""
  cluster_subnet_group_name = ""
}
