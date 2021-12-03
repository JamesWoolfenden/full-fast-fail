# fail
# CKV_AWS_170: "Ensure QLDB ledger permissions mode is set to STANDARD"
# CKV_AWS_172: "Ensure QLDB ledger has deletion protection enabled"

resource "aws_qldb_ledger" "disabled" {
  name             = "ledger"
  permissions_mode = "ALLOW_ALL"

  deletion_protection = false
}
