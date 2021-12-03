# fails
# CKV_GCP_62: "Bucket should log access"
# CKV_GCP_29: "Ensure that Cloud Storage buckets have uniform bucket-level access enabled"

resource "google_storage_bucket" "logging" {
  name                        = "jgwloggingbucket"
  location                    = var.location
  uniform_bucket_level_access = false
}
