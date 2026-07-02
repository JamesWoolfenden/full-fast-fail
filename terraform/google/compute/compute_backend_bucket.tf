# fail
# Cloud CDN backend buckets must have a Cloud Armor security policy (HLD_GCP_194)
resource "google_compute_backend_bucket" "fail" {
  name        = "backend-bucket-fail"
  project     = "gcp-bridgecrew-deployment"
  bucket_name = google_storage_bucket.fail.name
  enable_cdn  = true
}

resource "google_storage_bucket" "fail" {
  name     = "backend-bucket-fail-contents"
  project  = "gcp-bridgecrew-deployment"
  location = "US"
}
