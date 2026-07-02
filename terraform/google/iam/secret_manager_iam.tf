resource "google_secret_manager_secret" "fail" {
  secret_id = "iam-fail-secret"
  project   = "gcp-bridgecrew-deployment"

  replication {
    auto {}
  }
}

# fail
# Default and built-in service accounts must not be used in IAM bindings (HLD_GCP_210)
resource "google_secret_manager_secret_iam_binding" "fail" {
  project   = "gcp-bridgecrew-deployment"
  secret_id = google_secret_manager_secret.fail.secret_id
  role      = "roles/secretmanager.secretAccessor"
  members   = ["serviceAccount:123456789012-compute@developer.gserviceaccount.com"]
}

# fail
# Default and built-in service accounts must not be used in IAM bindings (HLD_GCP_210)
resource "google_secret_manager_secret_iam_member" "fail" {
  project   = "gcp-bridgecrew-deployment"
  secret_id = google_secret_manager_secret.fail.secret_id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:123456789012-compute@developer.gserviceaccount.com"
}

resource "google_secret_manager_regional_secret" "fail" {
  secret_id = "iam-fail-regional-secret"
  location  = "us-central1"
  project   = "gcp-bridgecrew-deployment"
}

# fail
# Default and built-in service accounts must not be used in IAM bindings (HLD_GCP_210)
resource "google_secret_manager_regional_secret_iam_binding" "fail" {
  project   = "gcp-bridgecrew-deployment"
  location  = google_secret_manager_regional_secret.fail.location
  secret_id = google_secret_manager_regional_secret.fail.secret_id
  role      = "roles/secretmanager.secretAccessor"
  members   = ["serviceAccount:123456789012-compute@developer.gserviceaccount.com"]
}

# fail
# Default and built-in service accounts must not be used in IAM bindings (HLD_GCP_210)
resource "google_secret_manager_regional_secret_iam_member" "fail" {
  project   = "gcp-bridgecrew-deployment"
  location  = google_secret_manager_regional_secret.fail.location
  secret_id = google_secret_manager_regional_secret.fail.secret_id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:123456789012-compute@developer.gserviceaccount.com"
}
