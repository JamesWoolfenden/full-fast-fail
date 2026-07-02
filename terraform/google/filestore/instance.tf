# fail
# Cloud Filestore instances must use a customer-managed encryption key (HLD_GCP_164)
resource "google_filestore_instance" "fail" {
  name     = "filestore-fail"
  location = "us-central1-a"
  project  = "gcp-bridgecrew-deployment"
  tier     = "BASIC_HDD"

  file_shares {
    capacity_gb = 1024
    name        = "share1"
  }

  networks {
    network = "default"
    modes   = ["MODE_IPV4"]
  }
}
