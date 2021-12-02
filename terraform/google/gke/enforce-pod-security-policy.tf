

resource "google_container_cluster" "fail" {
  pod_security_policy_config {
    enabled = "false"
  }
}
