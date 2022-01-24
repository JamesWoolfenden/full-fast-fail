# fails
# CKV_GCP_33: "Ensure oslogin is enabled for a Project"

resource "google_compute_project_metadata" "default" {
  metadata = {
    foo = "bar"
  }
}
