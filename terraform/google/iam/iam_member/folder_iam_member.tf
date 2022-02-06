# fails
# CKV_GCP_44: "Ensure no roles that enable to impersonate and manage all service accounts are used at a folder level"
# CKV_GCP_48: "Ensure Default Service account is not used at a folder level"

# tfsec
# Resource 'google_folder_iam_member.fail' assigns a role to a default service account.

resource "google_folder_iam_member" "fail" {
  folder = "folder-123"
  role   = "roles/whatever"
  member = "123-compute@developer.gserviceaccount.com"
}
