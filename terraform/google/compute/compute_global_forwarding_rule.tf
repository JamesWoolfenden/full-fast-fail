# fail
# Forwarding rules must not target unencrypted HTTP proxies (HLD_GCP_106)
# Global forwarding rules must not use HTTP proxies with external load balancing (HLD_GCP_241)
resource "google_compute_global_forwarding_rule" "fail" {
  name                  = "global-forwarding-rule-fail"
  project               = "gcp-bridgecrew-deployment"
  load_balancing_scheme = "EXTERNAL"
  port_range            = "80"
  target                = google_compute_target_http_proxy.global_fail.id
}

resource "google_compute_target_http_proxy" "global_fail" {
  name    = "global-target-http-proxy-fail"
  project = "gcp-bridgecrew-deployment"
  url_map = google_compute_url_map.global_fwd_rule_fail.id
}

resource "google_compute_url_map" "global_fwd_rule_fail" {
  name            = "global-url-map-fail"
  project         = "gcp-bridgecrew-deployment"
  default_service = google_compute_backend_service.fail.id
}
