# fail
# GCE instance templates must use a customer-managed encryption key for the boot disk (HLD_GCP_187)
resource "google_compute_regional_instance_template" "fail" {
  name         = "regional-instance-template-fail"
  project      = "gcp-bridgecrew-deployment"
  region       = "us-central1"
  machine_type = "n1-standard-1"

  disk {
    source_image = "debian-cloud/debian-12"
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network = "default"
  }
}
