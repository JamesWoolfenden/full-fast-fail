# fails
# CKV2_GCP_1: "Ensure GKE clusters are not running using the Compute Engine default service account "
resource "google_project_default_service_accounts" "not_ok" {
  project = "my-project-id"
  action  = "DELETE"
  id      = "1234"
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "my-node-pool"
  location   = "us-central1"
  cluster    = google_container_cluster.primary_A.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_project_default_service_accounts.not_ok.id
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
