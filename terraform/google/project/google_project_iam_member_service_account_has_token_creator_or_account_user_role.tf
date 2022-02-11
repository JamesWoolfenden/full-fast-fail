# fails
# todo
resource "google_project_iam_member" "positive1" {
  project = "your-project-id"
  role    = "roles/iam.serviceAccountTokenCreator"
  member  = "serviceAccount:my-other-app@appspot.gserviceacccount.com"
}
