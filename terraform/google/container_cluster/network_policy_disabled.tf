# fails
# todo
resource "google_container_cluster" "positive1" {
  name               = "marcellus-wallace"
  location           = "us-central1-a"
  initial_node_count = 3
  network_policy {
    enabled = true
  }

  timeouts {
    create = "30m"
    update = "40m"
  }
}
