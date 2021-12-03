resource "google_storage_bucket_iam_member" "member" {
  bucket = google_storage_bucket.default.name
  role   = "roles/storage.admin"
  member = "allUsers"
}
