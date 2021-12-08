# fail
# CKV_GCP_49: "Ensure no roles that enable to impersonate and manage all service accounts are used at a project level"
# CKV_GCP_41: "Ensure that IAM users are not assigned the Service Account User or Service Account Token Creator roles at project level"

resource "google_service_account" "test" {
  account_id   = "account123"
  display_name = "account123"
}

resource "google_project_iam_member" "project" {
  project = "your-project-id"
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${google_service_account.test.email}"
}
