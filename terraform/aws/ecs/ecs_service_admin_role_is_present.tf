# fails
# todo

resource "aws_ecs_service" "fail_service" {
  name            = "mongodb"
  cluster         = aws_ecs_cluster.fail.id
  task_definition = aws_ecs_task_definition.fail.arn
  desired_count   = 3
  iam_role        = "admin"
  depends_on      = [aws_iam_role_policy.foo]

  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.foo.arn
    container_name   = "mongo"
    container_port   = 8080
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [us-west-2a, us-west-2b]"
  }
}
