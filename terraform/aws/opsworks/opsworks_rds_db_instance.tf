resource "aws_opsworks_rds_db_instance" "my_instance" {
  stack_id            = aws_opsworks_stack.my_stack.id
  rds_db_instance_arn = aws_db_instance.my_instance.arn
  db_user             = "someUser"
  db_password         = "somePass"
}
