resource "google_pubsub_topic" "fail" {
  name    = "iam-fail-topic"
  project = "gcp-bridgecrew-deployment"
}

resource "google_pubsub_subscription" "fail" {
  name    = "iam-fail-subscription"
  topic   = google_pubsub_topic.fail.id
  project = "gcp-bridgecrew-deployment"
}

# fail
# Default and built-in service accounts must not be used in IAM bindings (HLD_GCP_210)
resource "google_pubsub_subscription_iam_binding" "fail" {
  project      = "gcp-bridgecrew-deployment"
  subscription = google_pubsub_subscription.fail.name
  role         = "roles/pubsub.subscriber"
  members      = ["serviceAccount:123456789012-compute@developer.gserviceaccount.com"]
}

# fail
# Default and built-in service accounts must not be used in IAM bindings (HLD_GCP_210)
resource "google_pubsub_subscription_iam_member" "fail" {
  project      = "gcp-bridgecrew-deployment"
  subscription = google_pubsub_subscription.fail.name
  role         = "roles/pubsub.subscriber"
  member       = "serviceAccount:123456789012-compute@developer.gserviceaccount.com"
}

# fail
# Default and built-in service accounts must not be used in IAM bindings (HLD_GCP_210)
resource "google_pubsub_topic_iam_member" "fail" {
  project = "gcp-bridgecrew-deployment"
  topic   = google_pubsub_topic.fail.name
  role    = "roles/pubsub.publisher"
  member  = "serviceAccount:123456789012-compute@developer.gserviceaccount.com"
}
