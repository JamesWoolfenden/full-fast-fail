

resource "google_container_cluster" "fail" {
  enable_shielded_nodes = "false"
}
