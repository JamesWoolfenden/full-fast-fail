# fails
#CKV_GCP_84: "Ensure Artifact Registry Repositories are encrypted with Customer Supplied Encryption Keys (CSEK)"

resource "google_artifact_registry_repository" "fail" {
  provider = google-beta

  location      = "us-central1"
  repository_id = "my-repository"
  description   = "example docker repository with cmek"
  format        = "DOCKER"
  #   kms_key_name = "kms-key"
}

resource "google_artifact_registry_repository_iam_binding" "fail1" {
  provider   = google-beta
  location   = google_artifact_registry_repository.fail.location
  repository = google_artifact_registry_repository.fail.name
  role       = "roles/viewer"
  members = [
    "allAuthenticatedUsers",
  ]
}
