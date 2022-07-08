# todo autoscaling should define lb
# Terraform currently provides both a standalone aws_autoscaling_attachment resource
# (describing an ASG attached to an ELB or ALB), and an aws_autoscaling_group with load_balancers and target_group_arns defined in-line.
#  These two methods are not mutually-exclusive. If aws_autoscaling_attachment resources are used, either alone or with inline
#  load_balancers or target_group_arns, the aws_autoscaling_group resource must be configured to ignore changes to the load_balancers
#  and target_group_arns arguments within a lifecycle configuration block.
resource "aws_autoscaling_group" "bar" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  launch_template {
    id      = aws_launch_template.foobar.id
    version = "$Latest"
  }
  tags = {
    "key" = "value"
  }
}
