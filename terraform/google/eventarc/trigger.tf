# fail
# Eventarc trigger service account must have roles/run.invoker (HLD_GCP_297)
resource "google_eventarc_trigger" "fail" {
  name     = "trigger-fail"
  location = "us-central1"
  project  = "gcp-bridgecrew-deployment"

  matching_criteria {
    attribute = "type"
    value     = "google.cloud.pubsub.topic.v1.messagePublished"
  }

  destination {
    cloud_run_service {
      service = "run-service-fail"
      region  = "us-central1"
    }
  }

  service_account = google_service_account.eventarc.email
}

resource "google_service_account" "eventarc" {
  project      = "gcp-bridgecrew-deployment"
  account_id   = "eventarc-trigger"
  display_name = "Eventarc trigger"
}
