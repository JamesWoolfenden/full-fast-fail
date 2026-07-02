# fail
# Dialogflow agents must have logging enabled (HLD_GCP_236)
resource "google_dialogflow_agent" "fail" {
  project               = "gcp-bridgecrew-deployment"
  display_name          = "fail-agent"
  default_language_code = "en"
  time_zone             = "America/New_York"
  enable_logging        = false
}
