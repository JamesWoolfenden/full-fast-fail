# fail
# Backup DR vaults must configure a minimum enforced retention duration (HLD_PROPOSED_031)
resource "google_backup_dr_backup_vault" "fail" {
  provider        = google-beta
  location        = "us-central1"
  backup_vault_id = "backup-vault-fail"
  project         = "gcp-bridgecrew-deployment"
}
