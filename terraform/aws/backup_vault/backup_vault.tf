# fail
# CKV_AWS_166: "Ensure Backup Vault is encrypted at rest using KMS CMK"

resource "aws_backup_vault" "backup" {
  name = "example_backup_vault"
  tags = { test = "Fail" }
}
