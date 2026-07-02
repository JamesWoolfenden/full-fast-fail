# fail
# Cloud Logging buckets must configure a retention period of at least 30 days (HLD_GCP_129)
# Cloud Logging project buckets must use a customer-managed encryption key (HLD_PROPOSED_027)
resource "google_logging_project_bucket_config" "fail" {
  project        = "gcp-bridgecrew-deployment"
  location       = "global"
  bucket_id      = "_Default"
  retention_days = 1
}
