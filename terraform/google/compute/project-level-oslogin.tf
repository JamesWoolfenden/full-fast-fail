

resource "google_compute_project_metadata" "default" {
  metadata = {
    enable-oslogin = false
  }
}
