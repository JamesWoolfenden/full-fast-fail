# fails
# destination_encryption_configuration - cant be set as of 11/2/2022
resource "google_bigquery_job" "fail" {
  job_id = "job_query"

  labels = {
    "example-label" = "example-value"
  }

  query {
    query = "SELECT state FROM [lookerdata:cdc.project_tycho_reports]"

    destination_table {
      project_id = google_bigquery_table.foo.project
      dataset_id = google_bigquery_table.foo.dataset_id
      table_id   = google_bigquery_table.foo.table_id
    }

    allow_large_results = true
    flatten_results     = true

    script_options {
      key_result_statement = "LAST"
    }
  }
}
