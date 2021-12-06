# fails
# CKV_GCP_46: "Ensure Default Service account is not used at a project level"

resource "google_project_iam_binding" "fail-service" {
  project = "your-project-id"
  role    = "roles/editor"

  members = [
    "user",
    "serviceAccount:test-compute@developer.gserviceaccount.com",
  ]
}
