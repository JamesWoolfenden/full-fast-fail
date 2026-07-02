# fail
# Regional forwarding rules must not use HTTP proxies with external load balancing (HLD_GCP_240)
# Forwarding rules must not target unencrypted HTTP proxies (HLD_GCP_106)
resource "google_compute_forwarding_rule" "fail" {
  name                  = "forwarding-rule-fail"
  project               = "gcp-bridgecrew-deployment"
  region                = "us-central1"
  load_balancing_scheme = "EXTERNAL"
  ip_protocol           = "TCP"
  port_range            = "80"
  target                = google_compute_region_target_http_proxy.fail.id
}

resource "google_compute_region_target_http_proxy" "fail" {
  name    = "target-http-proxy-fail"
  project = "gcp-bridgecrew-deployment"
  region  = "us-central1"
  url_map = google_compute_region_url_map.fail.id
}

resource "google_compute_region_url_map" "fail" {
  name            = "url-map-fail"
  project         = "gcp-bridgecrew-deployment"
  region          = "us-central1"
  default_service = google_compute_region_backend_service.fwd_rule_fail.id
}

resource "google_compute_region_backend_service" "fwd_rule_fail" {
  name    = "region-backend-service-fwd-rule-fail"
  project = "gcp-bridgecrew-deployment"
  region  = "us-central1"

  health_checks = [google_compute_health_check.fail.id]
}
