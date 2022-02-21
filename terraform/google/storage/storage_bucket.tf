# fails
# CKV_GCP_62: "Bucket should log access"
# CKV_GCP_29: "Ensure that Cloud Storage buckets have uniform bucket-level access enabled"
# CKV_GCP_63: "Bucket should not log to itself"
# Ensure Cloud storage has versioning enabledCheckov (CKV_GCP_78)
# CKV2_GCP_4: "Ensure that retention policies on log buckets are configured using Bucket Lock"

# tfsec
# google-storage-enable-ubla
resource "google_storage_bucket" "static_site" {
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

resource "google_storage_bucket" "fail_self" {
  name          = "image-store.com"
  location      = "EU"
  force_destroy = true
  logging {
    log_bucket = "image-store.com"
  }


  versioning = {
    enabled = false
  }
}


resource "google_logging_folder_sink" "folder_sink_bad_1" {
  name        = "my-sink"
  description = "some explanation on what this is"
  folder      = "folder-name"
  destination = google_storage_bucket.static_site.name
  filter      = "resource.type = gce_instance AND severity >= WARNING"
}
