# fail
# GCP routes must not send default internet-bound traffic through the default internet gateway (HLD_GCP_308)
resource "google_compute_route" "fail" {
  name             = "route-fail"
  project          = "gcp-bridgecrew-deployment"
  network          = google_compute_network.route_fail.name
  dest_range       = "0.0.0.0/0"
  next_hop_gateway = "default-internet-gateway"
  priority         = 1000
}

resource "google_compute_network" "route_fail" {
  name                    = "network-for-route-fail"
  project                 = "gcp-bridgecrew-deployment"
  auto_create_subnetworks = false
}
