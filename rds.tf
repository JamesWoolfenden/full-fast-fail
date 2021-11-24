resource "aws_rds_cluster" "fail2" {
  backup_retention_period = 0
  db_subnet_group_name    = aws_db_subnet_group.default.name
  master_username         = "james"
  master_password         = "password12345"
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = ["subnet-08d97e381dbc80d40", "subnet-03fdfb13a135366a7"]
}
