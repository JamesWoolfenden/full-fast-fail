# fail
# Cloud Logging buckets must configure a retention period of at least 30 days (all scopes) (HLD_PROPOSED_026)
resource "google_logging_folder_bucket_config" "fail" {
  folder         = "folders/123456789"
  location       = "global"
  bucket_id      = "_Default"
  retention_days = 1
}

resource "google_logging_organization_bucket_config" "fail" {
  organization   = "organizations/123456789"
  location       = "global"
  bucket_id      = "_Default"
  retention_days = 1
}

resource "google_logging_billing_account_bucket_config" "fail" {
  billing_account = "000000-000000-000000"
  location        = "global"
  bucket_id       = "_Default"
  retention_days  = 1
}
