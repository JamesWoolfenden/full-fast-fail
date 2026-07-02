# fail
# Cloud Monitoring alert policies must have notification channels configured (HLD_GCP_165)
resource "google_monitoring_alert_policy" "fail" {
  project      = "gcp-bridgecrew-deployment"
  display_name = "alert-policy-fail"
  combiner     = "OR"

  conditions {
    display_name = "condition-fail"
    condition_threshold {
      filter          = "resource.type = \"gce_instance\""
      comparison      = "COMPARISON_GT"
      duration        = "60s"
      threshold_value = 0.9
    }
  }
}
