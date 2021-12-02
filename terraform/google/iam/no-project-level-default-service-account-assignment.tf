
resource "google_project_iam_member" "project-123" {
  project = "project-123"
  role    = "roles/whatever"
  member  = "123-compute@developer.gserviceaccount.com"
}
