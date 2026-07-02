# fail
# Cloud NAT gateways must have logging enabled (HLD_GCP_066)
resource "google_compute_router_nat" "fail" {
  name                               = "router-nat-fail"
  project                            = "gcp-bridgecrew-deployment"
  router                             = google_compute_router.nat_fail.name
  region                             = "us-central1"
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

resource "google_compute_router" "nat_fail" {
  name    = "router-fail"
  project = "gcp-bridgecrew-deployment"
  region  = "us-central1"
  network = google_compute_network.nat_fail.name
}

resource "google_compute_network" "nat_fail" {
  name                    = "network-for-nat-fail"
  project                 = "gcp-bridgecrew-deployment"
  auto_create_subnetworks = false
}
