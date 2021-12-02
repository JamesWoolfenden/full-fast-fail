
resource "google_container_cluster" "fail" {
}

resource "google_container_cluster" "gke" {
  master_auth {
    username = ""
    password = ""
    client_certificate_config {
      issue_client_certificate = true
    }
  }
}
