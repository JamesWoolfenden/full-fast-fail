# fails
# todo aws_kms_key is set
# todo storage_encrypted is true

resource "aws_docdb_cluster_snapshot" "fail" {
  db_cluster_identifier          = aws_docdb_cluster.example.id
  db_cluster_snapshot_identifier = "resourcetestsnapshot1234"
  # kms_key_id=aws_kms_key.example.arn
  # storage_encrypted=true
}
