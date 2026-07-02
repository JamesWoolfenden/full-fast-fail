# fail
# Cloud VPN tunnels must use IKEv2 (HLD_GCP_169)
resource "google_compute_vpn_tunnel" "fail" {
  name               = "vpn-tunnel-fail"
  project            = "gcp-bridgecrew-deployment"
  region             = "us-central1"
  peer_ip            = "8.8.8.8"
  shared_secret      = "a-shared-secret"
  target_vpn_gateway = google_compute_vpn_gateway.tunnel_fail.id
  ike_version        = 1

  depends_on = [google_compute_forwarding_rule.vpn_tunnel_fail_esp]
}

resource "google_compute_vpn_gateway" "tunnel_fail" {
  name    = "vpn-gateway-for-tunnel-fail"
  project = "gcp-bridgecrew-deployment"
  region  = "us-central1"
  network = google_compute_network.tunnel_fail.id
}

resource "google_compute_network" "tunnel_fail" {
  name                    = "network-for-tunnel-fail"
  project                 = "gcp-bridgecrew-deployment"
  auto_create_subnetworks = false
}

resource "google_compute_address" "tunnel_fail" {
  name    = "address-for-tunnel-fail"
  project = "gcp-bridgecrew-deployment"
  region  = "us-central1"
}

resource "google_compute_forwarding_rule" "vpn_tunnel_fail_esp" {
  name        = "fr-esp-tunnel-fail"
  project     = "gcp-bridgecrew-deployment"
  region      = "us-central1"
  ip_protocol = "ESP"
  ip_address  = google_compute_address.tunnel_fail.address
  target      = google_compute_vpn_gateway.tunnel_fail.id
}
