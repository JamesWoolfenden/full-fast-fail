# fails
# Ensure RDS uses a modern CaCertCheckov (CKV_AWS_211)
# Ensure that RDS instances have Multi-AZ enabledCheckov CKV_AWS_157
# Ensure that enhanced monitoring is enabled for Amazon RDS instancesCheckov CKV_AWS_118
# Ensure that respective logs of Amazon Relational Database Service (Amazon RDS) are enabledCheckov CKV_AWS_129
resource "aws_db_instance" "fail" {
  allocated_storage                   = 20
  storage_type                        = "gp2"
  engine                              = "mysql"
  engine_version                      = "5.7"
  instance_class                      = "db.t2.micro"
  name                                = "mydb"
  username                            = "foo"
  password                            = "foobarbaz"
  iam_database_authentication_enabled = true
  storage_encrypted                   = true
  ca_cert_identifier                  = "rds-ca-2015"
  tags                                = { test = "fail" }
}
