# fails
# todo dont allow all ports
# todo Google Compute Network should not use default firewall rule
resource "google_compute_firewall" "fail" {
  name    = "test-firewall"
  network = google_compute_network.positive1.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  source_tags = ["web"]
}

resource "google_compute_network" "positive1" {
  name = "test-network"
}
