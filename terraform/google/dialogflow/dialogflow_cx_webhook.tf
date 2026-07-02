# fail
# Dialogflow CX webhooks must have Stackdriver logging enabled (HLD_GCP_238)
resource "google_dialogflow_cx_webhook" "fail" {
  parent                     = "projects/gcp-bridgecrew-deployment/locations/us-central1/agents/fail-agent"
  display_name               = "fail-webhook"
  enable_stackdriver_logging = false

  generic_web_service {
    uri = "https://example.com/webhook"
  }
}
