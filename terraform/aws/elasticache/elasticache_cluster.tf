# fail
# CKV_AWS_134: "Ensure that Amazon ElastiCache Redis clusters have automatic backup turned on"

# tfsec
# Resource 'aws_elasticache_cluster.default' should have snapshot retention specified
resource "aws_elasticache_cluster" "default" {
  cluster_id           = "cluster"
  engine               = "redis"
  node_type            = "cache.m5.large"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis6.x"
}
