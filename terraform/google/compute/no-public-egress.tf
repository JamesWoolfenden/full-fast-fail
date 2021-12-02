

resource "google_compute_firewall" "fail" {
  destination_ranges = ["0.0.0.0/0"]
}
