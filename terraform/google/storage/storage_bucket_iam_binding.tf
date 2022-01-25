# fails
# CKV_GCP_28: "Ensure that Cloud Storage bucket is not anonymously or publicly accessible"

# tfsec
# google-storage-no-public-access
resource "google_storage_bucket_iam_binding" "binding" {
  bucket = google_storage_bucket.static-site-fail.name
  role   = "roles/storage.admin"
  members = [
    "allAuthenticatedUsers",
  ]
}
