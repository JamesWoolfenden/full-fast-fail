# fail
# GCP DNS policies must have query logging enabled (HLD_GCP_313)
resource "google_dns_policy" "fail" {
  name    = "dns-policy-fail"
  project = "gcp-bridgecrew-deployment"

  enable_inbound_forwarding = false
}
