# fail
# Classic VPN gateways are deprecated — use HA VPN gateways (HLD_GCP_180)
resource "google_compute_vpn_gateway" "fail" {
  name    = "vpn-gateway-fail"
  project = "gcp-bridgecrew-deployment"
  region  = "us-central1"
  network = google_compute_network.vpn_gateway_fail.id
}

resource "google_compute_network" "vpn_gateway_fail" {
  name                    = "network-for-vpn-gateway-fail"
  project                 = "gcp-bridgecrew-deployment"
  auto_create_subnetworks = false
}
