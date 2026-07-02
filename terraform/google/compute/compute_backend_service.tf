# fail
# GCP backend services must enable access logging (HLD_GCP_310)
# GCP backend services must have a Cloud Armor security policy attached (HLD_GCP_050)
resource "google_compute_backend_service" "fail" {
  name        = "backend-service-fail"
  project     = "gcp-bridgecrew-deployment"
  protocol    = "HTTP"
  port_name   = "http"
  timeout_sec = 10

  health_checks = [google_compute_health_check.fail.id]
}

resource "google_compute_health_check" "fail" {
  name    = "health-check-fail"
  project = "gcp-bridgecrew-deployment"

  http_health_check {
    port = 80
  }
}
