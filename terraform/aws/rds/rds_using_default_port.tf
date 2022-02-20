# fails
# Ensure that respective logs of Amazon Relational Database Service (Amazon RDS) are enabledCheckov CKV_AWS_129
# Ensure all data stored in the RDS is securely encrypted at restCheckov CKV_AWS_16
# Ensure that enhanced monitoring is enabled for Amazon RDS instancesCheckov CKV_AWS_118
# Ensure RDS database has IAM authentication enabledCheckov CKV_AWS_161
# Ensure that RDS instances have Multi-AZ enabledCheckov CKV_AWS_157
# todo ensure default ports arent being used?
resource "aws_db_instance" "positive1" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = aws_elasticache_parameter_group.default.id
  skip_final_snapshot  = true
  port                 = 3306
  tags                 = { test = "Fail" }
}
