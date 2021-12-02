
resource "google_organization_iam_member" "org-123" {
  org_id = "organization-123"
  role   = "roles/whatever"
  member = "123-compute@developer.gserviceaccount.com"
}
