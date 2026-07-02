resource "google_bigquery_dataset" "fail" {
  dataset_id = "iam_fail_dataset"
  location   = "US"
  project    = "gcp-bridgecrew-deployment"
}

# fail
# Default and built-in service accounts must not be used in IAM bindings (HLD_GCP_210)
resource "google_bigquery_dataset_iam_binding" "fail" {
  project    = "gcp-bridgecrew-deployment"
  dataset_id = google_bigquery_dataset.fail.dataset_id
  role       = "roles/bigquery.dataViewer"
  members    = ["serviceAccount:123456789012-compute@developer.gserviceaccount.com"]
}

# fail
# Default and built-in service accounts must not be used in IAM bindings (HLD_GCP_210)
resource "google_bigquery_dataset_iam_member" "fail" {
  project    = "gcp-bridgecrew-deployment"
  dataset_id = google_bigquery_dataset.fail.dataset_id
  role       = "roles/bigquery.dataViewer"
  member     = "serviceAccount:123456789012-compute@developer.gserviceaccount.com"
}
