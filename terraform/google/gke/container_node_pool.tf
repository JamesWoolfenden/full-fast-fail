# fails
# CKV_GCP_69: "Ensure the GKE Metadata Server is Enabled"
# CKV_GCP_9: "Ensure 'Automatic node repair' is enabled for Kubernetes Clusters"
# CKV_GCP_10: "Ensure 'Automatic node upgrade' is enabled for Kubernetes Clusters"
# CKV_GCP_68: "Ensure Secure Boot for Shielded GKE Nodes is Enabled"
# CKV_GCP_22: "Ensure Container-Optimized OS (cos) is used for Kubernetes Engine Clusters Node image"


resource "google_container_node_pool" "fail" {
  name       = "my-node-pool"
  cluster    = google_container_cluster.primary.id
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.default.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
  management {
    auto_repair = false
  }
}
