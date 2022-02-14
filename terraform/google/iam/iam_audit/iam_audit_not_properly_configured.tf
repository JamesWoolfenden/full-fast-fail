# fails
# todo service must be allServices with no exceptions
# audit_log_config.exempted_members must be empty
resource "google_project_iam_audit_config" "fail" {
  project = "your-project-id"
  service = "some_specific_service"
  audit_log_config {
    log_type = "ADMIN_READ"
  }
  audit_log_config {
    log_type = "DATA_READ"
    exempted_members = [
      "user:joebloggs@hashicorp.com"
    ]
  }
}

# resource "google_project" "fail" {
#   name                = "My Project"
#   project_id          = "your-project-id"
#   org_id              = "1234567"
#   auto_create_network = true
# }
