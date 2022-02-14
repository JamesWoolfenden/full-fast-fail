# fails
# CKV_GCP_9: "Ensure 'Automatic node repair' is enabled for Kubernetes Clusters"
# CKV_GCP_10: "Ensure 'Automatic node upgrade' is enabled for Kubernetes Clusters"
# CKV_GCP_22: "Ensure Container-Optimized OS (cos) is used for Kubernetes Engine Clusters Node image"
# CKV_GCP_68: "Ensure Secure Boot for Shielded GKE Nodes is Enabled"
# CKV_GCP_69: "Ensure the GKE Metadata Server is Enabled"
# CKV_GCP_72: "Ensure Integrity Monitoring for Shielded GKE Nodes is Enabled"


# tfsec
# enable-auto-repair
# enable-auto-upgrade
# node-metadata-security
# node-pool-uses-cos
resource "google_container_node_pool" "fail_pool" {
  name       = "my-node-pool"
  cluster    = google_container_cluster.primary.id
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"
    workload_metadata_config {
      node_metadata = "EXPOSE"
    }
    shielded_instance_config {
      enable_integrity_monitoring = false
    }

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.default.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    image_type = "UBUNTU_CONTAINERD"
  }
  management {
    auto_repair  = false
    auto_upgrade = false
  }
}
