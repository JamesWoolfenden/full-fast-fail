
# fails
# todo auto_repair != false
resource "google_container_node_pool" "positive2" {
  name       = "my-node-pool"
  location   = "us-central1"
  cluster    = google_container_cluster.primary.name
  node_count = 1

  management {
    auto_repair = false
  }
}
