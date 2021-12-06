# fails
# CKV_GCP_49: "Ensure no roles that enable to impersonate and manage all service accounts are used at a project level"
# CKV_GCP_42: "Ensure that Service Account has no Admin privileges"

# tfsec
# 'google_project_iam_member.project' grants IAM to a user object. It is recommended to manage user permissions with groups.

resource "google_project_iam_member" "fail" {
  project = "your-project-id"
  role    = "roles/owner"
  member  = "user:test@example-project.iam.gserviceaccount.com"
}
