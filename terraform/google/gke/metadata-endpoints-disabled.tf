
resource "google_container_cluster" "fail" {
  metadata {
    disable-legacy-endpoints = false
  }
}
