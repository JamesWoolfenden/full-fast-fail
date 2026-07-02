# fail
# Firewall policy rules must have logging enabled (HLD_PROPOSED_034)
resource "google_compute_firewall_policy_rule" "fail" {
  firewall_policy = google_compute_firewall_policy.fail.id
  rule_name       = "fw-policy-rule-fail"
  description     = "fails HLD_PROPOSED_034"
  priority        = 1000
  direction       = "INGRESS"
  action          = "allow"
  enable_logging  = false

  match {
    src_ip_ranges = ["0.0.0.0/0"]
    layer4_configs {
      ip_protocol = "tcp"
      ports       = ["443"]
    }
  }
}

resource "google_compute_firewall_policy" "fail" {
  parent      = "organizations/123456789"
  short_name  = "fw-policy-fail"
  description = "fails HLD_PROPOSED_034"
}
