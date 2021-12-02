

resource "google_container_node_pool" "fail" {
  node_config {
    workload_metadata_config {
      node_metadata = "EXPOSE"
    }
  }
}
