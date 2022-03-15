# fails
# CKV_AWS_198: "Ensure no aws_db_security_group resources exist"
# Ensure every security groups rule has a descriptionCheckov CKV_AWS_23
# kics
# public
# cidr range to large

resource "aws_db_security_group" "positive1" {
  name = "rds_sg"

  ingress {
    cidr = "0.0.0.0/0"
  }

  ingress {
    cidr = "10.0.0.0/24"
  }
  tags = { test = "fail" }
}
