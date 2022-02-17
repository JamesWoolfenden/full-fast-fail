# fail
# CKV_AWS_31: "Ensure all data stored in the Elasticache Replication Group is securely encrypted at transit and has auth token"
# CKV_AWS_29: "Ensure all data stored in the Elasticache Replication Group is securely encrypted at rest"
# CKV_AWS_191: "Ensure Elasticache replication group is encrypted by KMS using a customer managed Key (CMK)"
# CKV_AWS_30: "Ensure all data stored in the Elasticache Replication Group is securely encrypted at transit"

# tfsec
# AWS036 Resource 'aws_elasticache_replication_group.fail' defines an unencrypted Elasticache Replication Group (transit_encryption_enabled set to false).

resource "aws_elasticache_replication_group" "fail" {
  replication_group_id          = "foo"
  replication_group_description = "my foo cluster"

  at_rest_encryption_enabled = false
  tags                       = { test = "fail" }
}
