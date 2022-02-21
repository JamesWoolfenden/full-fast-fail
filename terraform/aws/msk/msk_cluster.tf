# fail
# CKV_AWS_81: "Ensure MSK Cluster encryption in rest and transit is enabled"
# CKV_AWS_80: "Ensure MSK Cluster logging is enabled"

# tfsec
# Resource 'aws_msk_cluster.name' does not have any broker logging enabled
# AWS022 Resource 'aws_msk_cluster.example' defines a MSK cluster that allows plaintext as well as TLS encrypted data in transit (missing encryption_info block).
# Resource 'aws_msk_cluster.name' defines a MSK cluster that allows plaintext as well as TLS encrypted data in transit.

resource "aws_msk_cluster" "name" {
  name = "example"

  encryption_info {
    encryption_in_transit {
      client_broker = "TLS_PLAINTEXT"
      in_cluster    = true
    }
  }
  tags = { test = "fail" }
}
