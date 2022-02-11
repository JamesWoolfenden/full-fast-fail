# fail
# CKV_GCP_80: "Ensure Big Query Tables are encrypted with Customer Supplied Encryption Keys (CSEK)"
resource "google_bigquery_table" "fail" {
  dataset_id = google_bigquery_dataset.default.dataset_id
  table_id   = "sheet"

  external_data_configuration {
    autodetect    = true
    source_format = "GOOGLE_SHEETS"

    google_sheets_options {
      skip_leading_rows = 1
    }

    source_uris = [
      "https://docs.google.com/spreadsheets/d/123456789012345",
    ]
  }

  # encryption_configuration {
  #   kms_key_name = var.kms_key_name
  # }
}
