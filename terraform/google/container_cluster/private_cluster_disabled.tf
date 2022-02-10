# fails
# todo

resource "google_container_cluster" "positive7" {
  name               = "marcellus-wallace"
  location           = "us-central1-a"
  initial_node_count = 3
  private_cluster_config {
    enable_private_endpoint = false
    enable_private_nodes    = false
  }

  timeouts {
    create = "30m"
    update = "40m"
  }
}
