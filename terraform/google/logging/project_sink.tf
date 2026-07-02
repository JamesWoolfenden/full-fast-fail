# fail
# Cloud Logging sinks must have a filter configured (HLD_GCP_130)
# Log sinks must use a unique writer identity (HLD_GCP_131 / HLD_GCP_258)
resource "google_logging_project_sink" "fail" {
  name                   = "sink-fail"
  project                = "gcp-bridgecrew-deployment"
  destination            = "storage.googleapis.com/${google_storage_bucket.sink_fail.name}"
  unique_writer_identity = false
}

resource "google_storage_bucket" "sink_fail" {
  name     = "sink-fail-bucket"
  project  = "gcp-bridgecrew-deployment"
  location = "US"
}
