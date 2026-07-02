# fail
# Secret Manager secrets must have replication explicitly configured (HLD_GCP_033)
# Secret Manager secrets must have automatic rotation configured (HLD_GCP_123)
resource "google_secret_manager_secret" "fail" {
  secret_id = "my-secret"
  project   = "gcp-bridgecrew-deployment"
}
