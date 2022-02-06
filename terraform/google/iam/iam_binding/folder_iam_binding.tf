# fails
# CKV_GCP_48: "Ensure Default Service account is not used at a folder level"
# CKV_GCP_44: "Ensure no roles that enable to impersonate and manage all service accounts are used at a folder level"

# tfsec
#  'google_folder_iam_binding.folder' grants IAM to a user object. It is recommended to manage user permissions with groups.
# Resource 'google_folder_iam_binding.folder' assigns a role to a default service account.

resource "google_folder_iam_binding" "fail" {
  folder = "folders/1234567"
  role   = "roles/editor"

  members = [
    "user:jane@example.com",
    "serviceAccount:test-compute@appspot.gserviceaccount.com",
  ]
}
