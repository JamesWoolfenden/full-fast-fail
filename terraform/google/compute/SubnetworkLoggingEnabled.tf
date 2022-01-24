# fail
#  CKV_GCP_26: "Ensure that VPC Flow Logs is enabled for every subnet in a VPC Network"

# tfsec
# Resource 'google_compute_subnetwork.without_logging' uses default value for enable_flow_logs

resource "google_compute_subnetwork" "without_logging" {
  name          = "log-test-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.custom-test.id
}
