resource "google_storage_bucket" "fail" {
  name     = "storage-acl-fail-bucket"
  project  = "gcp-bridgecrew-deployment"
  location = "US"
}

# fail
# GCS bucket ACLs must not grant public access (HLD_GCP_088)
resource "google_storage_bucket_acl" "fail" {
  bucket = google_storage_bucket.fail.name

  role_entity = ["READER:allUsers"]
}

# fail
# GCS bucket ACLs must not grant public access (HLD_GCP_088)
resource "google_storage_default_object_acl" "fail" {
  bucket = google_storage_bucket.fail.name

  role_entity = [
    "READER:allUsers",
  ]
}
