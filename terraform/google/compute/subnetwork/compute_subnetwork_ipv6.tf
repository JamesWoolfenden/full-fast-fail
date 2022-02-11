# fail
# Ensure that Private google access is enabled for IPV6 Checkov (CKV_GCP_76)
# Ensure that private_ip_google_access is enabled for Subnet Checkov (CKV_GCP_74)
# Ensure that VPC Flow Logs is enabled for every subnet in a VPC Network Checkov CKV_GCP_26
# tfsec
# Resource 'google_compute_subnetwork.without_logging' uses default value for enable_flow_logs

resource "google_compute_subnetwork" "fail" {
  name             = "log-test-subnetwork"
  ip_cidr_range    = "10.2.0.0/16"
  stack_type       = "IPV4_IPV6"
  ipv6_access_type = "EXTERNAL"
  region           = "us-central1"
  network          = google_compute_network.custom-test.id
  # purpose="INTERNAL_HTTPS_LOAD_BALANCER" if set ignored
  # log_config {
  #   metadata="EXCLUDE_ALL_METADATA"
  # }
  private_ip_google_access   = false
  private_ipv6_google_access = false
}
