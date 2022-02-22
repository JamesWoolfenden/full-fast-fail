# fails
# todo auto_minor_version_upgrade =true

resource "aws_docdb_cluster_instance" "example" {
  count              = 2
  identifier         = "docdb-cluster-demo-${count.index}"
  cluster_identifier = aws_docdb_cluster.default.id
  instance_class     = "db.r5.large"
  tags = {
    test = "failed"
  }
}
