
resource "google_storage_bucket_iam_binding" "binding" {
  bucket = google_storage_bucket.default.name
  role   = "roles/storage.admin"
  members = [
    "allAuthenticatedUsers",
  ]
}
