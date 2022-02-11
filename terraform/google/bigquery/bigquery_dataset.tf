# fails
# CKV_GCP_15: "Ensure that BigQuery datasets are not anonymously or publicly accessible"
# todo default_encryption_configuration/kms_key_name is set
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
