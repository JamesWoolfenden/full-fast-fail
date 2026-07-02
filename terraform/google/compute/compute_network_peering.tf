# fail
# VPC network peering must not export custom routes (HLD_GCP_193)
resource "google_compute_network_peering" "fail" {
  name         = "network-peering-fail"
  network      = google_compute_network.peering_fail.self_link
  peer_network = google_compute_network.peering_fail_peer.self_link

  export_custom_routes = true
}

resource "google_compute_network" "peering_fail" {
  name                    = "network-peering-fail-primary"
  project                 = "gcp-bridgecrew-deployment"
  auto_create_subnetworks = false
}

resource "google_compute_network" "peering_fail_peer" {
  name                    = "network-peering-fail-peer"
  project                 = "gcp-bridgecrew-deployment"
  auto_create_subnetworks = false
}
