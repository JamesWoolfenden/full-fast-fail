# fails
# CKV_GCP_45: "Ensure no roles that enable to impersonate and manage all service accounts are used at an organization level"
# CKV_GCP_47: "Ensure default service account is not used at an organization level"

# tfsec
# Resource 'google_folder_iam_binding.folder-123' grants service account access to a user at folder level.
# Resource 'google_organization_iam_binding.organization-123' grants service account access to a user at organization level.

resource "google_organization_iam_binding" "organization_123" {
  org_id  = "org-123"
  role    = "roles/iam.serviceAccountUser"
  members = ["serviceAccount:test-compute@appspot.gserviceaccount.com", ]
}
