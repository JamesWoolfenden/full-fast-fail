resource "google_service_account" "fail" {
  account_id   = "iam-fail-sa"
  display_name = "IAM fail service account"
  project      = "gcp-bridgecrew-deployment"
}

# fail
# Default and built-in service accounts must not be used in IAM bindings (HLD_GCP_210)
resource "google_service_account_iam_binding" "fail_default_sa" {
  service_account_id = google_service_account.fail.name
  role               = "roles/iam.serviceAccountUser"
  members            = ["serviceAccount:123456789012-compute@developer.gserviceaccount.com"]
}

# fail
# Service account IAM must not grant public access (HLD_GCP_078)
resource "google_service_account_iam_binding" "fail_public" {
  service_account_id = google_service_account.fail.name
  role               = "roles/iam.serviceAccountTokenCreator"
  members            = ["allUsers"]
}

# fail
# Default and built-in service accounts must not be used in IAM bindings (HLD_GCP_210)
resource "google_service_account_iam_member" "fail_default_sa" {
  service_account_id = google_service_account.fail.name
  role               = "roles/iam.serviceAccountUser"
  member             = "serviceAccount:123456789012-compute@developer.gserviceaccount.com"
}

# fail
# Service account IAM must not grant public access (HLD_GCP_078)
resource "google_service_account_iam_member" "fail_public" {
  service_account_id = google_service_account.fail.name
  role               = "roles/iam.serviceAccountTokenCreator"
  member             = "allUsers"
}

# fail
# google_service_account_iam_policy must not grant public access (HLD_GCP_289)
data "google_iam_policy" "fail" {
  binding {
    role    = "roles/iam.serviceAccountUser"
    members = ["allUsers"]
  }
}

resource "google_service_account_iam_policy" "fail" {
  service_account_id = google_service_account.fail.name
  policy_data        = data.google_iam_policy.fail.policy_data
}
