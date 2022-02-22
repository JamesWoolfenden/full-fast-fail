# fails
# todo kms_key_id  is set
# swtorage encrypted is true
resource "aws_neptune_cluster_snapshot" "example" {
  db_cluster_identifier          = aws_neptune_cluster.example.id
  db_cluster_snapshot_identifier = "resourcetestsnapshot1234"
}
