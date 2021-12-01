# fail
# CKV_AWS_83: "Ensure Elasticsearch Domain enforces HTTPS"
# CKV_AWS_6: "Ensure all Elasticsearch has node-to-node encryption enabled"
# CKV_AWS_5: "Ensure all data stored in the Elasticsearch is securely encrypted at rest"
# CKV_AWS_137: "Ensure that Elasticsearch is configured inside a VPC"
# CKV_AWS_84: "Ensure Elasticsearch Domain Logging is enabled"
#todo needs parity policy

# tfsec
# AWS032 Resource 'aws_elasticsearch_domain.node_to_node_encryption_disabled' defines an Elasticsearch domain with plaintext traffic (enabled attribute set to false).
# AWS057 Resource 'aws_elasticsearch_domain.node_to_node_encryption_disabled' explicitly disables logging on the domain.
# AWS031 Resource 'aws_elasticsearch_domain.node_to_node_encryption_disabled' defines an unencrypted Elasticsearch domain (enabled attribute set to false).
# AWS034 Resource 'aws_elasticsearch_domain.node_to_node_encryption_disabled' defines an Elasticsearch domain with an outdated TLS policy (set to Policy-Min-TLS-1-0-2019-07).
# AWS033 Resource 'aws_elasticsearch_domain.node_to_node_encryption_disabled' defines an Elasticsearch domain with plaintext traffic (enabled attribute set to false).
# AWS070 Resource 'aws_elasticsearch_domain.node_to_node_encryption_disabled' is missing 'AUDIT_LOGS` in one of the `log_publishing_options`-`log_type` attributes so audit log is not enabled

resource "aws_elasticsearch_domain" "node_to_node_encryption_disabled" {
  domain_name = "node_to_node_encryption_disabled"
  domain_endpoint_options {
    enforce_https = false
    tls_security_policy = "Policy-Min-TLS-1-0-2019-07"
  }

  cluster_config {
    instance_count = 2 // a value > 1
  }

  encrypt_at_rest {
    enabled = false
  }

  node_to_node_encryption {
    enabled = false
  }

  #   log_publishing_options {
  #   cloudwatch_log_group_arn = aws_cloudwatch_log_group.example.arn
  #   log_type                 = "INDEX_SLOW_LOGS"
  #   enabled                  = false
  # }
}
