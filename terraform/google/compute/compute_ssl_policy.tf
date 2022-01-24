# fails
# CKV_GCP_4: "Ensure no HTTPS or SSL proxy load balancers permit SSL policies with weak cipher suites"

# tfsec
# google-compute-use-secure-tls-policy
resource "google_compute_ssl_policy" "modern-profile" {
  name            = "nonprod-ssl-policy"
  profile         = "MODERN"
  min_tls_version = "TLS_1_1"
}
