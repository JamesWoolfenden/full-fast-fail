resource "aws_qldb_ledger" "disabled" {
  name             = "ledger"
  permissions_mode = "ALLOW_ALL"

  deletion_protection = false
}
