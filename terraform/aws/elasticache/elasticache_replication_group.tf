# fail
# CKV_AWS_31: "Ensure all data stored in the Elasticache Replication Group is securely encrypted at transit and has auth token"
# CKV_AWS_29: "Ensure all data stored in the Elasticache Replication Group is securely encrypted at rest"
# CKV_AWS_191: "Ensure Elasticache replication group is encrypted by KMS using a customer managed Key (CMK)"
# CKV_AWS_30: "Ensure all data stored in the Elasticache Replication Group is securely encrypted at transit"

# tfsec
# AWS036 resource 'aws_elasticache_replication_group.fail' defines an unencrypted Elasticache Replication Group (transit_encryption_enabled set to false).

resource "aws_elasticache_replication_group" "fail" {
  replication_group_id          = "tf-%s"
  replication_group_description = "test description"
  node_type                     = "cache.t2.micro"
  number_cache_clusters         = "1"
  port                          = 6379
  subnet_group_name             = aws_elasticache_subnet_group.bar.name
  security_group_ids            = [aws_security_group.bar.id]
  parameter_group_name          = "default.redis3.2"
  availability_zones            = [data.aws_availability_zones.available.names[0]]
  engine_version                = "3.2.6"
  transit_encryption_enabled    = false
  tags = {
    "key" = "value"
  }
}
