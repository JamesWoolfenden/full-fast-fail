
resource "google_service_account" "test" {
  account_id   = "account123"
  display_name = "account123"
}

resource "google_project_iam_member" "project" {
  project = "your-project-id"
  role    = "roles/owner"
  member  = "serviceAccount:${google_service_account.test.email}"
}
