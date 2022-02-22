# fails
# CKV_AWS_102: "Ensure Neptune Cluster instance is not publicly available"
# auto_minor_version_upgrade= true defaultis false

resource "aws_neptune_cluster_instance" "fail" {
  publicly_accessible = true
  tags                = { test = "Fail" }
}
