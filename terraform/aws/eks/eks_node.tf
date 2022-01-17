# fail
# CKV_AWS_100: "Ensure Amazon EKS Node group has implicit SSH access from 0.0.0.0/0"

resource "aws_eks_node_group" "fail" {
  cluster_name    = aws_eks_cluster.example.name
  node_group_name = "example"
  node_role_arn   = aws_iam_role.example.arn
  subnet_ids      = aws_subnet.example[*].id

  remote_access {
    ec2_ssh_key = "some-key"
  }

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }
}
