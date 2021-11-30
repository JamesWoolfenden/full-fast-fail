resource "aws_elasticsearch_domain" "node_to_node_encryption_disabled" {
  domain_name = "node_to_node_encryption_disabled"

  cluster_config {
    instance_count = 2 // a value > 1
  }

  node_to_node_encryption {
    enabled = false
  }
}
