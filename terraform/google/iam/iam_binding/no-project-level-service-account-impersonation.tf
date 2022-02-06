# fails
# CKV_GCP_49: "Ensure no roles that enable to impersonate and manage all service accounts are used at a project level"
# CKV_GCP_41: "Ensure that IAM users are not assigned the Service Account User or Service Account Token Creator roles at project level"

# tfsec
#  Resource 'google_project_iam_binding.project-123' grants service account access to a user at project level.

resource "google_project_iam_binding" "project-123" {
  project = "project-123"
  role    = "roles/iam.serviceAccountUser"
  members = ["serviceAccount:test-compute@appspot.gserviceaccount.com", ]
}
