# fail
# CKV_GCP_73: "Ensure Cloud Armor prevents message lookup in Log4j2. See CVE-2021-44228 aka log4jshell"

resource "google_compute_security_policy" "allow" {
  name = "example"

  rule {
    action   = "allow"
    priority = 1
    match {
      expr {
        expression = "evaluatePreconfiguredExpr('cve-canary')"
      }
    }
  }
}
