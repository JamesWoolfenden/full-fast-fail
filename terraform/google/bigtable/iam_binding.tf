# fails
# Ensure that BigQuery Tables are not anonymously or publicly accessible CKV_GCP_100
resource "google_bigquery_table_iam_binding" "fail1" {
  cluster = "my-public-table-binding1"
  role    = "roles/bigquery.dataOwner"
  members = [
    "allAuthenticatedUsers",
  ]
}
