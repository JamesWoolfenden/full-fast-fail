# fail
# GCP project metadata must enable OS Login for all instances (HLD_GCP_160)
resource "google_compute_project_metadata_item" "fail" {
  project = "gcp-bridgecrew-deployment"
  key     = "enable-oslogin"
  value   = "false"
}
