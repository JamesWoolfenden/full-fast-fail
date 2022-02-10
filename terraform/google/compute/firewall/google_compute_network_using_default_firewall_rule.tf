# fails
# todo dont use the default firewall - i think this means no rules?
resource "google_compute_firewall" "fail" {
  name    = "default"
  network = google_compute_network.positive1.name
}
