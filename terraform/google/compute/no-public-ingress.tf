
resource "google_compute_firewall" "fail" {
  source_ranges = ["0.0.0.0/0"]
}
