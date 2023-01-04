# fails
# Ensure that Artifact Registry repositories are not anonymously or publicly accessible CKV_GCP_101
resource "google_artifact_registry_repository_iam_binding" "fail1" {
  provider   = google-beta
  location   = google_artifact_registry_repository.my-repo.location
  repository = google_artifact_registry_repository.my-repo.name
  role       = "roles/viewer"
  members = [
    "allAuthenticatedUsers",
  ]
}

resource "google_artifact_registry_repository_iam_member" "fail1" {
  provider   = google-beta
  location   = google_artifact_registry_repository.my-repo.location
  repository = google_artifact_registry_repository.my-repo.name
  role       = "roles/viewer"
  member     = "allAuthenticatedUsers"
}
