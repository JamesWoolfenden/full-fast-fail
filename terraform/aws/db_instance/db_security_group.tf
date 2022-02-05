# fails
# CKV_AWS_198: "Ensure no aws_db_security_group resources exist"
# kics
# public
# todo cidr range to large

resource "aws_db_security_group" "positive1" {
  name = "rds_sg"

  ingress {
    cidr = "0.0.0.0/0"
  }

  ingress {
    cidr = "10.0.0.0/24"
  }
}
