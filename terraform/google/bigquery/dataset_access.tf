resource "google_bigquery_dataset" "access_fail" {
  dataset_id = "bq_fail_dataset"
  project    = "gcp-bridgecrew-deployment"
  location   = "US"
}

# fail
# BigQuery datasets must not allow public access (HLD_GCP_020)
resource "google_bigquery_dataset_access" "fail" {
  dataset_id    = google_bigquery_dataset.access_fail.dataset_id
  project       = "gcp-bridgecrew-deployment"
  role          = "READER"
  special_group = "allAuthenticatedUsers"
}

# fail
# BigQuery datasets must not allow public access (HLD_GCP_020)
resource "google_bigquery_dataset_iam_binding" "fail" {
  dataset_id = google_bigquery_dataset.access_fail.dataset_id
  project    = "gcp-bridgecrew-deployment"
  role       = "roles/bigquery.dataViewer"
  members    = ["allUsers"]
}

# fail
# BigQuery datasets must not allow public access (HLD_GCP_020)
resource "google_bigquery_dataset_iam_member" "fail" {
  dataset_id = google_bigquery_dataset.access_fail.dataset_id
  project    = "gcp-bridgecrew-deployment"
  role       = "roles/bigquery.dataViewer"
  member     = "allUsers"
}
