# fail
# Cloud Scheduler HTTP targets must use OIDC or OAuth token authentication (HLD_GCP_201)
resource "google_cloud_scheduler_job" "fail" {
  name     = "scheduler-job-fail"
  project  = "gcp-bridgecrew-deployment"
  region   = "us-central1"
  schedule = "*/5 * * * *"

  http_target {
    uri         = "https://example.com/trigger"
    http_method = "POST"
  }
}
