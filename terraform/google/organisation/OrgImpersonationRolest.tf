
resource "google_organization_iam_binding" "organization" {
  org_id = "your-organization-id"
  role   = "roles/editor"

  members = [
    "user:jane@example.com",
    "serviceAccount:test-compute@developer.gserviceaccount.com",
  ]
}
