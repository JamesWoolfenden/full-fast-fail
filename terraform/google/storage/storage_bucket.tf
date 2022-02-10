# fails
# CKV_GCP_62: "Bucket should log access"
# CKV_GCP_29: "Ensure that Cloud Storage buckets have uniform bucket-level access enabled"
# CKV_GCP_63: "Bucket should not log to itself"

# tfsec
# google-storage-enable-ubla
resource "google_storage_bucket" "static-site" {
  name          = "image-store.com"
  location      = "EU"
  force_destroy = true
  # logging {
  #   log_bucket = "image-store.com"
  # }


  versioning = {
    enabled = false
  }
}
