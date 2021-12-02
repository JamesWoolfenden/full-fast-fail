
resource "google_project_iam_binding" "project-123" {
  project = "project-123"
  role    = "roles/iam.serviceAccountUser"
}
