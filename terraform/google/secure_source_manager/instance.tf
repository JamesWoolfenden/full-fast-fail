# fail
# Secure Source Manager instances must use a customer-managed encryption key (HLD_PROPOSED_032)
resource "google_secure_source_manager_instance" "fail" {
  instance_id = "ssm-fail"
  location    = "us-central1"
  project     = "gcp-bridgecrew-deployment"
}

# fail
# Secure Source Manager IAM bindings must not grant access to allUsers or allAuthenticatedUsers (HLD_PROPOSED_033)
resource "google_secure_source_manager_instance_iam_binding" "fail" {
  project     = "gcp-bridgecrew-deployment"
  location    = "us-central1"
  instance_id = google_secure_source_manager_instance.fail.instance_id
  role        = "roles/securesourcemanager.repoReader"
  members     = ["allUsers"]
}

resource "google_secure_source_manager_repository" "fail" {
  repository_id = "ssm-repo-fail"
  instance      = google_secure_source_manager_instance.fail.instance_id
  location      = "us-central1"
  project       = "gcp-bridgecrew-deployment"
}

# fail
# Secure Source Manager IAM bindings must not grant access to allUsers or allAuthenticatedUsers (HLD_PROPOSED_033)
resource "google_secure_source_manager_repository_iam_binding" "fail" {
  project       = "gcp-bridgecrew-deployment"
  location      = "us-central1"
  repository_id = google_secure_source_manager_repository.fail.repository_id
  role          = "roles/securesourcemanager.repoReader"
  members       = ["allUsers"]
}
