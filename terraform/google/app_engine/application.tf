# fail
# App Engine applications should enable Identity-Aware Proxy (HLD_GCP_190)
resource "google_app_engine_application" "fail" {
  project     = "gcp-bridgecrew-deployment"
  location_id = "us-central"
}
