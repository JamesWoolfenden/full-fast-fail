# fails
# CKV_AWS_161: "Ensure RDS database has IAM authentication enabled"
# CKV_AWS_157: "Ensure that RDS instances have Multi-AZ enabled"
# CKV_AWS_129: "Ensure that respective logs of Amazon Relational Database Service (Amazon RDS) are enabled"
# CKV_AWS_133: "Ensure that RDS instances has backup policy"
# CKV_AWS_17: "Ensure all data stored in RDS is not publicly accessible"
# CKV_AWS_118: "Ensure that enhanced monitoring is enabled for Amazon RDS instances"
# CKV_AWS_16: "Ensure all data stored in the RDS is securely encrypted at rest"

resource "aws_db_instance" "default" {
  name                   = var.dbname
  engine                 = "mysql"
  option_group_name      = aws_db_option_group.default.name
  parameter_group_name   = aws_db_parameter_group.default.name
  db_subnet_group_name   = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.default.id]

  identifier              = "rds-${local.resource_prefix.value}"
  engine_version          = "8.0" # Latest major version
  instance_class          = "db.t3.micro"
  allocated_storage       = "20"
  username                = "admin"
  password                = var.password
  apply_immediately       = true
  multi_az                = false
  backup_retention_period = 0
  storage_encrypted       = false
  skip_final_snapshot     = true
  monitoring_interval     = 0
  publicly_accessible     = true
}
