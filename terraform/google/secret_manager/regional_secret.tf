# fail
# Regional Secret Manager secrets must encrypt with a customer-managed key (HLD_PROPOSED_008)
# Secret Manager secrets must have automatic rotation configured (HLD_GCP_123)
resource "google_secret_manager_regional_secret" "fail" {
  secret_id = "regional-secret-fail"
  location  = "us-central1"
  project   = "gcp-bridgecrew-deployment"
}
