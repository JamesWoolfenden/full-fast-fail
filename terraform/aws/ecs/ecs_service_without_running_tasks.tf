resource "aws_ecs_service" "fail_notasks" {
  name    = "empty"
  cluster = aws_ecs_cluster.fail.id
  tags    = { test = "fail" }
}
