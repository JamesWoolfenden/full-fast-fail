# fail
# Dialogflow CX agents must have Stackdriver logging enabled (HLD_GCP_237)
# Dialogflow CX agents must have security settings configured (HLD_PROPOSED_019)
resource "google_dialogflow_cx_agent" "fail" {
  project               = "gcp-bridgecrew-deployment"
  display_name          = "fail-cx-agent"
  location              = "us-central1"
  default_language_code = "en"
  time_zone             = "America/New_York"
}
