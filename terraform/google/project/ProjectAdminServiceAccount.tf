resource "google_project_iam_member" "project" {
  project = "your-project-id"
  role    = "roles/owner"
  member  = "user:test@example-project.iam.gserviceaccount.com"
}
