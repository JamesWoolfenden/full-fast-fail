
resource "google_project" "fail" {
  name                = "My Project"
  project_id          = "your-project-id"
  org_id              = "1234567"
  auto_create_network = true
}
