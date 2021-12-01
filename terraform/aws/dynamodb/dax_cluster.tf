# fail
# CKV_AWS_47: "Ensure DAX is encrypted at rest (default is unencrypted)"

# tfsec
# AWS081 DAX cluster 'aws_dax_cluster.name' does not have server side encryption configured. By default it is disabled.

resource "aws_dax_cluster" "name" {
  cluster_name         = var.cluster_name
  iam_role_arn         = var.iam_role_arn
  parameter_group_name = aws_dax_parameter_group.example.name
  subnet_group_name    = aws_dax_subnet_group.example.name
  tags                 = var.common_tags
}
