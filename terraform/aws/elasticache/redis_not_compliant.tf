#fails
#todo ElastiCache where engine='redis' should have (engineVersion='3.2.6' or engineVersion='3.2.10' or engineVersion>='4.0.10' or engineVersion>='5.0.0')
resource "aws_elasticache_cluster" "fails" {
  cluster_id      = "cluster-example"
  engine          = "redis"
  node_type       = "cache.m4.large"
  num_cache_nodes = 1
  engine_version  = "2.6.13"
  port            = 6379
}
