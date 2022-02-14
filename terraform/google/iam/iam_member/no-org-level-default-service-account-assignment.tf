# fails
# CKV_GCP_45: "Ensure no roles that enable to impersonate and manage all service accounts are used at an organization level"
# CKV_GCP_47: "Ensure default service account is not used at an organization level"

# tfsec
#  Resource 'google_project_iam_member.project-123' assigns a role to a default service account.

resource "google_organization_iam_member" "org_123" {
  org_id = "organization-123"
  role   = "roles/editor"
  member = "123-compute@developer.gserviceaccount.com"
}
