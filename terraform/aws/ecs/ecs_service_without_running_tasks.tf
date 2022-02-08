resource "aws_ecs_service" "fail-notasks" {
  name    = "empty"
  cluster = aws_ecs_cluster.fail.id
}
