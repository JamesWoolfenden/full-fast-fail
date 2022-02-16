# fails
# todo - look for az_mode not specified or being equal to single-az -memcache only
resource "aws_elasticache_cluster" "positive1" {
  cluster_id      = "cluster-example"
  engine          = "memcached"
  num_cache_nodes = 3
    tags = {
    "key" = "value"
  }
}

