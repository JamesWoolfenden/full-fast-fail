# fail
# CKV_AWS_134: "Ensure that Amazon ElastiCache Redis clusters have automatic backup turned on"
# to do should have snapshot retention specified - redis only
# todo Check if the Memcached is disabled on the ElastiCache why?
# todo "ElastiCache should not use the default port (an attacker can easily guess the port). For engine set to Redis, the default port is 6379. The Memcached default port is 11211
# todo "Check if ElastiCache nodes are not being created across multi AZ", az_mode
# tfsec
# Resource 'aws_elasticache_cluster.default' should have snapshot retention specified
resource "aws_elasticache_cluster" "fail_redis" {
  # az_mode =
  cluster_id           = "cluster"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis6.x"
  tags = {
    "key" = "value"
  }
}
