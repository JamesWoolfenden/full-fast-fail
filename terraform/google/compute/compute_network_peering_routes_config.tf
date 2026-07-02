# fail
# GCP PSA peering routes config must not export custom routes (HLD_GCP_315)
resource "google_compute_network_peering_routes_config" "fail" {
  project              = "gcp-bridgecrew-deployment"
  peering              = google_service_networking_connection.fail.peering
  network              = google_compute_network.psa_peering_fail.name
  export_custom_routes = true
  import_custom_routes = false
}

resource "google_compute_network" "psa_peering_fail" {
  name                    = "network-psa-peering-fail"
  project                 = "gcp-bridgecrew-deployment"
  auto_create_subnetworks = false
}

resource "google_compute_global_address" "psa_peering_fail" {
  name          = "psa-range-fail"
  project       = "gcp-bridgecrew-deployment"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.psa_peering_fail.id
}

resource "google_service_networking_connection" "fail" {
  network                 = google_compute_network.psa_peering_fail.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.psa_peering_fail.name]
}
