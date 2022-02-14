# fail
# CKV_GCP_46: "Ensure Default Service account is not used at a project level"

resource "google_project_iam_member" "project_123" {
  project = "project-123"
  role    = "roles/whatever"
  member  = "123-compute@developer.gserviceaccount.com"
}
