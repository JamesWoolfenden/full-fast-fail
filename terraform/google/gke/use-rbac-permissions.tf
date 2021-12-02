

resource "google_container_cluster" "fail" {
  enable_legacy_abac = "true"
}
