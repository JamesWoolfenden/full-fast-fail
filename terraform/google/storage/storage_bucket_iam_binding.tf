# fails
# CKV_GCP_28: "Ensure that Cloud Storage bucket is not anonymously or publicly accessible"

resource "google_storage_bucket_iam_binding" "binding" {
  bucket = google_storage_bucket.default.name
  role   = "roles/storage.admin"
  members = [
    "allAuthenticatedUsers",
  ]
}
