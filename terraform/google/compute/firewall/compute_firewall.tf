# fails
# Ensure Google compute firewall ingress does not allow unrestricted FTP access Checkov (CKV_GCP_75)
# Ensure Google compute firewall ingress does not allow unrestricted rdp access Checkov CKV_GCP_3
# Ensure Google compute firewall ingress does not allow on ftp port Checkov (CKV_GCP_77)
# Ensure Google compute firewall ingress does not allow unrestricted ssh access Checkov CKV_GCP_2
# todo ensure that rule does not define full public egress
# todo check log_config setting

# tfsec
# google-compute-no-public-egress

resource "google_compute_firewall" "allow_all" {
  name               = "terragoat-${var.environment}-firewall"
  network            = google_compute_network.vpc.id
  destination_ranges = ["0.0.0.0/0"]
  source_ranges      = ["0.0.0.0/0"]
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  # log_config {
  #   metadata="EXCLUDE_ALL_METADATA"
  # }
}
