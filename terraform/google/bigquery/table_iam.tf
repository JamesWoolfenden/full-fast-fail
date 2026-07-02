resource "google_bigquery_table" "iam_fail" {
  dataset_id = google_bigquery_dataset.access_fail.dataset_id
  table_id   = "bq_fail_table"
  project    = "gcp-bridgecrew-deployment"

  schema = jsonencode([
    { name = "id", type = "STRING", mode = "NULLABLE" }
  ])
}

# fail
# BigQuery table IAM bindings must not grant access to allUsers or allAuthenticatedUsers (HLD_GCP_250)
resource "google_bigquery_table_iam_member" "fail" {
  dataset_id = google_bigquery_dataset.access_fail.dataset_id
  table_id   = google_bigquery_table.iam_fail.table_id
  project    = "gcp-bridgecrew-deployment"
  role       = "roles/bigquery.dataViewer"
  member     = "allUsers"
}
