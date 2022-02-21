# fail
# CKV_AWS_39: "Ensure Amazon EKS public endpoint disabled"
# CKV_AWS_58: "Ensure EKS Cluster has Secrets Encryption Enabled"
# CKV_AWS_38: "Ensure Amazon EKS public endpoint not accessible to 0.0.0.0/0"
# CKV_AWS_37: "Ensure Amazon EKS control plane logging enabled for all log types"
# todo encryption_config -provider - key_arn is encrypted with KMS


# tfsec
# AWS068  Resource 'aws_eks_cluster.fail' has public access cidr explicitly set to wide open
# AWS069  Resource 'aws_eks_cluster.fail' has public access is explicitly set to enabled
# AWS066  Resource 'aws_eks_cluster.fail' has no encryptionConfigBlock block
# AWS067  Resource 'aws_eks_cluster.fail' missing the enabled_cluster_log_types attribute to enable control plane logging

resource "aws_eks_cluster" "fail" {
  name     = "fail_cluster"
  role_arn = var.cluster_arn
  vpc_config {
    endpoint_public_access = true
    public_access_cidrs    = ["0.0.0.0/0"]
  }
  # encryption_config {
  #   provider {
  #     key_arn="someit"
  #   }
  # }

  tags = { test = "Fail" }
}
