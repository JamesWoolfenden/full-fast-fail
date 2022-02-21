# fail
# CKV_GCP_49: "Ensure no roles that enable to impersonate and manage all service accounts are used at a project level"
# CKV_GCP_41: "Ensure that IAM users are not assigned the Service Account User or Service Account Token Creator roles at project level"
# CKV2_GCP_3: "Ensure that there are only GCP-managed service account keys for each service account"
resource "google_service_account" "test" {
  account_id   = "account123"
  display_name = "account123"
}

resource "google_project_iam_member" "project" {
  project = "your-project-id"
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${google_service_account.test.email}"
}

resource "google_service_account_key" "account_bad" {
  service_account_id = google_service_account.test.name
  public_key_data    = "foo"
}
