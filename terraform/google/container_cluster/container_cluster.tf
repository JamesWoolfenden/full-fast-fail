# fails
# CKV_GCP_1: "Ensure Stackdriver Logging is set to Enabled on Kubernetes Engine Clusters"
# CKV_GCP_7: "Ensure Legacy Authorization is set to Disabled on Kubernetes Engine Clusters"
# CKV_GCP_8: "Ensure Stackdriver Monitoring is set to Enabled on Kubernetes Engine Clusters"
# CKV_GCP_12: "Ensure Network Policy is enabled on Kubernetes Engine Clusters"
# CKV_GCP_13: "Ensure a client certificate is used by clients to authenticate to Kubernetes Engine Clusters"
# CKV_GCP_19: "Ensure GKE basic auth is disabled"
# CKV_GCP_20: "Ensure master authorized networks is set to enabled in GKE clusters"
# CKV_GCP_21: "Ensure Kubernetes Clusters are configured with Labels"
# CKV_GCP_23: "Ensure Kubernetes Cluster is created with Alias IP ranges enabled"
# CKV_GCP_24: "Ensure PodSecurityPolicy controller is enabled on the Kubernetes Engine Clusters"
# CKV_GCP_25: "Ensure Kubernetes Cluster is created with Private cluster enabled"
# CKV_GCP_61: "Enable VPC Flow Logs and Intranode Visibility"
# CKV_GCP_64: "Ensure clusters are created with Private Nodes"
# CKV_GCP_65: "Manage Kubernetes RBAC users with Google Groups for GKE"
# CKV_GCP_66: "Ensure use of Binary Authorization"
# CKV_GCP_67: "Ensure legacy Compute Engine instance metadata APIs are Disabled"
# CKV_GCP_68: "Ensure Secure Boot for Shielded GKE Nodes is Enabled"
# CKV_GCP_69: "Ensure the GKE Metadata Server is Enabled"
# CKV_GCP_70: "Ensure the GKE Release Channel is set"
# CKV_GCP_71: "Ensure Shielded GKE Nodes are Enabled"
# CKV_GCP_72: "Ensure Integrity Monitoring for Shielded GKE Nodes is Enabled"
# to master auth password and username set

# tfsec
# enable-ip-aliasing
# enable-master-networks
# enable-stackdriver-logging
# enable-stackdriver-monitoring
# metadata-endpoints-disabled
# no-legacy-auth
# no-legacy-authentication
# no-public-control-plane
# use-cluster-labels
# use-rbac-permissions
resource "google_container_cluster" "fail" {
  enable_shielded_nodes = false #defaults to true for this
  node_config {
    shielded_instance_config {
      enable_integrity_monitoring = false
    }
  }
  #ip_allocation_policy = {}
  enable_legacy_abac = true
  logging_service    = "none"
  monitoring_service = "none"
  # master_authorized_networks_config {
  #   cidr_blocks {
  #     cidr_block="0.0.0.0/0"
  #   }
  # }
  master_auth {
    username = "paddy"
    password = "james"
    # client_certificate_config {
    #   issue_client_certificate = true
    # }
  }
  pod_security_policy_config {
    enabled = "false"
  }

}
