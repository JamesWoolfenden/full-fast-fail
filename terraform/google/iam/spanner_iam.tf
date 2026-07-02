resource "google_spanner_instance" "fail" {
  config       = "regional-us-central1"
  display_name = "iam-fail-spanner"
  num_nodes    = 1
  project      = "gcp-bridgecrew-deployment"
}

resource "google_spanner_database" "fail" {
  instance = google_spanner_instance.fail.name
  name     = "iam-fail-database"
  project  = "gcp-bridgecrew-deployment"
  ddl = [
    "CREATE TABLE t1 (t1 INT64 NOT NULL,) PRIMARY KEY(t1)",
  ]
  deletion_protection = false
}

# fail
# Default and built-in service accounts must not be used in IAM bindings (HLD_GCP_210)
resource "google_spanner_database_iam_binding" "fail_default_sa" {
  project  = "gcp-bridgecrew-deployment"
  instance = google_spanner_instance.fail.name
  database = google_spanner_database.fail.name
  role     = "roles/spanner.databaseUser"
  members  = ["serviceAccount:123456789012-compute@developer.gserviceaccount.com"]
}

# fail
# Spanner IAM bindings must not grant access to allUsers or allAuthenticatedUsers (HLD_GCP_178)
resource "google_spanner_database_iam_binding" "fail_public" {
  project  = "gcp-bridgecrew-deployment"
  instance = google_spanner_instance.fail.name
  database = google_spanner_database.fail.name
  role     = "roles/spanner.databaseReader"
  members  = ["allUsers"]
}

# fail
# Default and built-in service accounts must not be used in IAM bindings (HLD_GCP_210)
resource "google_spanner_database_iam_member" "fail_default_sa" {
  project  = "gcp-bridgecrew-deployment"
  instance = google_spanner_instance.fail.name
  database = google_spanner_database.fail.name
  role     = "roles/spanner.databaseUser"
  member   = "serviceAccount:123456789012-compute@developer.gserviceaccount.com"
}

# fail
# Spanner IAM bindings must not grant access to allUsers or allAuthenticatedUsers (HLD_GCP_178)
resource "google_spanner_database_iam_member" "fail_public" {
  project  = "gcp-bridgecrew-deployment"
  instance = google_spanner_instance.fail.name
  database = google_spanner_database.fail.name
  role     = "roles/spanner.databaseReader"
  member   = "allAuthenticatedUsers"
}

# fail
# Spanner IAM bindings must not grant access to allUsers or allAuthenticatedUsers (HLD_GCP_178)
resource "google_spanner_instance_iam_binding" "fail" {
  project  = "gcp-bridgecrew-deployment"
  instance = google_spanner_instance.fail.name
  role     = "roles/spanner.databaseReader"
  members  = ["allUsers"]
}

# fail
# Spanner IAM bindings must not grant access to allUsers or allAuthenticatedUsers (HLD_GCP_178)
resource "google_spanner_instance_iam_member" "fail" {
  project  = "gcp-bridgecrew-deployment"
  instance = google_spanner_instance.fail.name
  role     = "roles/spanner.databaseReader"
  member   = "allAuthenticatedUsers"
}
