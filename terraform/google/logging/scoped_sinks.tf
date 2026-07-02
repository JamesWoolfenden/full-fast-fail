# fail
# Log sinks must use a unique writer identity (HLD_GCP_258)
resource "google_logging_folder_sink" "fail" {
  name                   = "folder-sink-fail"
  folder                 = "folders/123456789"
  destination            = "storage.googleapis.com/${google_storage_bucket.sink_fail.name}"
  unique_writer_identity = false
}

resource "google_logging_organization_sink" "fail" {
  name                   = "org-sink-fail"
  org_id                 = "123456789"
  destination            = "storage.googleapis.com/${google_storage_bucket.sink_fail.name}"
  unique_writer_identity = false
}
