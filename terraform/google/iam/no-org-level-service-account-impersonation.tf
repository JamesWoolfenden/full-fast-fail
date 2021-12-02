

resource "google_organization_iam_binding" "organization-123" {
  org_id = "org-123"
  role   = "roles/iam.serviceAccountUser"
}
