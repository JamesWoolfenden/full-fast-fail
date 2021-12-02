
resource "google_compute_subnetwork" "fail" {
  name          = "test-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.custom-test.id
  secondary_ip_range {
    range_name    = "tf-test-secondary-range-update1"
    ip_cidr_range = "192.168.10.0/24"
  }
  enable_flow_logs = false
}

resource "google_compute_network" "custom-test" {
  name                    = "test-network"
  auto_create_subnetworks = false
}
