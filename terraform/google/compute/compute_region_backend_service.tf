# fail
# GCP backend services must have a Cloud Armor security policy attached (HLD_GCP_050)
resource "google_compute_region_backend_service" "fail" {
  name    = "region-backend-service-fail"
  project = "gcp-bridgecrew-deployment"
  region  = "us-central1"

  health_checks = [google_compute_region_health_check.fail.id]
}

resource "google_compute_region_health_check" "fail" {
  name    = "region-health-check-fail"
  project = "gcp-bridgecrew-deployment"
  region  = "us-central1"

  http_health_check {
    port = 80
  }
}
