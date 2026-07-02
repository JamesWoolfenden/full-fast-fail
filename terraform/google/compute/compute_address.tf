# fail
# google_compute_address must declare address_type explicitly (HLD_GCP_090)
resource "google_compute_address" "fail" {
  name    = "address-fail"
  project = "gcp-bridgecrew-deployment"
  region  = "us-central1"
}
