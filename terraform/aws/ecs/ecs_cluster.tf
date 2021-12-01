# fail
# CKV_AWS_65: "Ensure container insights are enabled on ECS cluster"

# tfsec
# AWS090 Resource 'aws_ecs_cluster.my_cluster' does not have containerInsights enabled

resource "aws_ecs_cluster" "my_cluster" {
  name = "white-hart"
}
