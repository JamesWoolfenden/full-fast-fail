resource "google_compute_network" "fail" {
  name                    = "test-network"
  auto_create_subnetworks = false
}
