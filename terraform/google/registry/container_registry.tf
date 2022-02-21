# fails
# CKV2_GCP_9: "Ensure that Container Registry repositories are not anonymously or publicly accessible"
resource "google_container_registry" "fail1" {
  project  = "my-project"
  location = "EU"
}

resource "google_storage_bucket_iam_member" "fail1_member" {
  bucket = google_container_registry.fail1.id
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}
