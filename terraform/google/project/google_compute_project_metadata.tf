# fails HLD_GCP_320 — enable-oslogin absent, project SSH falls back to unmanaged key auth
resource "google_compute_project_metadata" "fail_no_oslogin" {
  metadata = {
    foo = "bar"
  }
}

# passes HLD_GCP_320
resource "google_compute_project_metadata" "pass_oslogin" {
  metadata = {
    enable-oslogin = "true"
  }
}
