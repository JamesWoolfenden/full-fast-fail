# fails
# Ensure that BigQuery datasets are not anonymously or publicly accessibleCheckov CKV_GCP_15
# Ensure Big Query Tables are encrypted with Customer Supplied Encryption Keys (CSEK)Checkov (CKV_GCP_81)
# tfsec
# Resource 'google_bigquery_dataset.fail' has access.special_group set to allAuthenticatedUsers

resource "google_bigquery_dataset" "fail" {
  dataset_id                  = "example_dataset"
  friendly_name               = "test"
  description                 = "This is a test description"
  location                    = "EU"
  default_table_expiration_ms = 3600000

  labels = {
    env = "default"
  }

  access {
    role          = "OWNER"
    special_group = "allAuthenticatedUsers"
  }

  access {
    role   = "READER"
    domain = "hashicorp.com"
  }

  # default_encryption_configuration {
  #   kms_key_name=
  # }
}
