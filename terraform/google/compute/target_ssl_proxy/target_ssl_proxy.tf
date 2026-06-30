# fails HLD_GCP_319 — no ssl_policy attached, uses Google's permissive default TLS profile
resource "google_compute_target_ssl_proxy" "fail_no_policy" {
  name             = "test-proxy-no-policy"
  backend_service  = google_compute_backend_service.default.id
  ssl_certificates = [google_compute_ssl_certificate.default.id]
}

# passes HLD_GCP_319
resource "google_compute_target_ssl_proxy" "pass_with_policy" {
  name             = "test-proxy-with-policy"
  backend_service  = google_compute_backend_service.default.id
  ssl_certificates = [google_compute_ssl_certificate.default.id]
  ssl_policy       = google_compute_ssl_policy.modern.id
}
