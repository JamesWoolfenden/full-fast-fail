# fails
# CKV_GCP_47: "Ensure default service account is not used at an organization level"
# CKV_GCP_45: "Ensure no roles that enable to impersonate and manage all service accounts are used at an organization level"

resource "google_organization_iam_binding" "organization" {
  org_id = "your-organization-id"
  role   = "roles/editor"

  members = [
    "user:jane@example.com",
    "serviceAccount:test-compute@developer.gserviceaccount.com",
  ]
}
