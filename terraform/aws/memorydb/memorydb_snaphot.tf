# fails
# todo memorydb snapshot kms_key_arn is set


resource "aws_memorydb_snapshot" "example" {
  cluster_name = aws_memorydb_cluster.example.name
  name         = "my-snapshot"
}
