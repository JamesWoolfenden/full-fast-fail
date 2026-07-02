# fail
# Cloud Source Repository pubsub_configs must specify an explicit service account (HLD_GCP_300)
resource "google_sourcerepo_repository" "fail" {
  name    = "repo-fail"
  project = "gcp-bridgecrew-deployment"

  pubsub_configs {
    topic          = google_pubsub_topic.repo_events.id
    message_format = "JSON"
  }
}

resource "google_pubsub_topic" "repo_events" {
  name    = "repo-events-fail"
  project = "gcp-bridgecrew-deployment"
}

# fail
# Cloud Source Repository IAM bindings must not grant access to allUsers or allAuthenticatedUsers (HLD_GCP_312)
resource "google_sourcerepo_repository_iam_member" "fail" {
  project    = "gcp-bridgecrew-deployment"
  repository = google_sourcerepo_repository.fail.name
  role       = "roles/source.reader"
  member     = "allUsers"
}

# fail
# Cloud Source Repository IAM bindings must not grant access to allUsers or allAuthenticatedUsers (HLD_GCP_312)
resource "google_sourcerepo_repository_iam_binding" "fail" {
  project    = "gcp-bridgecrew-deployment"
  repository = google_sourcerepo_repository.fail.name
  role       = "roles/source.reader"
  members    = ["allUsers"]
}
