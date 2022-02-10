# fails
# Ensure PodSecurityPolicy controller is enabled on the Kubernetes Engine ClustersCheckov CKV_GCP_24
# Ensure the GKE Release Channel is setCheckov CKV_GCP_70
# Ensure clusters are created with Private NodesCheckov CKV_GCP_64
# Ensure Network Policy is enabled on Kubernetes Engine ClustersCheckov CKV_GCP_12
# Manage Kubernetes RBAC users with Google Groups for GKECheckov CKV_GCP_65
# Ensure GKE basic auth is disabledCheckov CKV_GCP_19
# Ensure a client certificate is used by clients to authenticate to Kubernetes Engine ClustersCheckov CKV_GCP_13
# Ensure Kubernetes Clusters are configured with LabelsCheckov CKV_GCP_21
resource "google_container_cluster" "fail1" {
  name               = var.name
  location           = var.location
  initial_node_count = 1
  project            = data.google_project.project.name

  network    = var.network
  subnetwork = var.subnetwork

  ip_allocation_policy {
    cluster_ipv4_cidr_block       = var.ip_allocation_policy["cluster_ipv4_cidr_block"]
    cluster_secondary_range_name  = var.ip_allocation_policy["cluster_secondary_range_name"]
    services_ipv4_cidr_block      = var.ip_allocation_policy["services_ipv4_cidr_block"]
    services_secondary_range_name = var.ip_allocation_policy["services_secondary_range_name"]
  }
}
