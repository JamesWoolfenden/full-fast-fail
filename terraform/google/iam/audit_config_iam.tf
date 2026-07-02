# fail
# Cloud Audit Logging must not exempt any members (HLD_GCP_256)
resource "google_folder_iam_audit_config" "fail" {
  folder  = "folders/123456789012"
  service = "allServices"

  audit_log_config {
    log_type = "DATA_READ"
    exempted_members = [
      "user:jane@example.com",
    ]
  }
}

# fail
# Cloud Audit Logging must not exempt any members (HLD_GCP_256)
resource "google_organization_iam_audit_config" "fail" {
  org_id  = "123456789012"
  service = "allServices"

  audit_log_config {
    log_type = "DATA_READ"
    exempted_members = [
      "user:jane@example.com",
    ]
  }
}
