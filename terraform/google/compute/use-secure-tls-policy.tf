
resource "google_compute_ssl_policy" "fail" {
  name            = "production-ssl-policy"
  profile         = "MODERN"
  min_tls_version = "TLS_1_1"
}
