# fails
# todo needs to have a link to aws_elasticache_subnet_group- a graph check
resource "aws_elasticache_cluster" "fail_vpc" {
  cluster_id      = "cluster-example"
  engine          = "memcached"
  node_type       = "cache.t2.micro"
  num_cache_nodes = 2
  //parameter_group_name = aws_elasticache_parameter_group.default.id
  port = 11211
  # subnet_group_name="subnet-04338b6369d8288a5"
}


provider "aws" {
  region = "eu-west-2"
}
