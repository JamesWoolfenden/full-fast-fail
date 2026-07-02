resource "google_bigtable_instance" "iam_fail" {
  name    = "bigtable-fail"
  project = "gcp-bridgecrew-deployment"

  cluster {
    cluster_id   = "bigtable-fail-cluster"
    zone         = "us-central1-a"
    num_nodes    = 1
    storage_type = "SSD"
  }
}

# fail
# Bigtable IAM bindings must not grant access to allUsers or allAuthenticatedUsers (HLD_PROPOSED_028)
resource "google_bigtable_instance_iam_binding" "fail" {
  instance = google_bigtable_instance.iam_fail.name
  project  = "gcp-bridgecrew-deployment"
  role     = "roles/bigtable.reader"
  members  = ["allUsers"]
}

resource "google_bigtable_table" "fail" {
  name          = "bigtable-fail-table"
  instance_name = google_bigtable_instance.iam_fail.name
  project       = "gcp-bridgecrew-deployment"
}

# fail
# Bigtable table IAM bindings must not grant access to allUsers or allAuthenticatedUsers (HLD_GCP_302)
resource "google_bigtable_table_iam_binding" "fail" {
  instance = google_bigtable_instance.iam_fail.name
  table    = google_bigtable_table.fail.name
  project  = "gcp-bridgecrew-deployment"
  role     = "roles/bigtable.reader"
  members  = ["allUsers"]
}

# fail
# Bigtable table IAM bindings must not grant access to allUsers or allAuthenticatedUsers (HLD_GCP_302)
resource "google_bigtable_table_iam_member" "fail" {
  instance = google_bigtable_instance.iam_fail.name
  table    = google_bigtable_table.fail.name
  project  = "gcp-bridgecrew-deployment"
  role     = "roles/bigtable.reader"
  member   = "allUsers"
}
