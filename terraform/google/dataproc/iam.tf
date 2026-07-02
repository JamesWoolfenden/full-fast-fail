resource "google_dataproc_cluster" "iam_fail" {
  name    = "dataproc-fail"
  project = "gcp-bridgecrew-deployment"
  region  = "us-central1"
}

# fail
# Dataproc cluster IAM bindings must not grant access to allUsers or allAuthenticatedUsers (HLD_GCP_249)
resource "google_dataproc_cluster_iam_member" "fail" {
  cluster = google_dataproc_cluster.iam_fail.name
  project = "gcp-bridgecrew-deployment"
  region  = "us-central1"
  role    = "roles/dataproc.viewer"
  member  = "allUsers"
}
