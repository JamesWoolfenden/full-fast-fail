resource "google_pubsub_topic" "iam_fail" {
  name    = "pubsub-fail-topic"
  project = "gcp-bridgecrew-deployment"
}

resource "google_pubsub_subscription" "fail" {
  name    = "pubsub-fail-sub"
  topic   = google_pubsub_topic.iam_fail.id
  project = "gcp-bridgecrew-deployment"
}

# fail
# Pub/Sub subscriptions must not grant access to allUsers or allAuthenticatedUsers (HLD_GCP_161)
resource "google_pubsub_subscription_iam_binding" "fail" {
  subscription = google_pubsub_subscription.fail.name
  project      = "gcp-bridgecrew-deployment"
  role         = "roles/pubsub.subscriber"
  members      = ["allUsers"]
}

# fail
# Pub/Sub subscriptions must not grant access to allUsers or allAuthenticatedUsers (HLD_GCP_161)
resource "google_pubsub_subscription_iam_member" "fail" {
  subscription = google_pubsub_subscription.fail.name
  project      = "gcp-bridgecrew-deployment"
  role         = "roles/pubsub.subscriber"
  member       = "allUsers"
}

# fail
# Pub/Sub topics must not grant access to allUsers or allAuthenticatedUsers (HLD_GCP_153)
resource "google_pubsub_topic_iam_member" "fail" {
  topic   = google_pubsub_topic.iam_fail.name
  project = "gcp-bridgecrew-deployment"
  role    = "roles/pubsub.publisher"
  member  = "allUsers"
}

# fail
# google_pubsub_topic_iam_policy must not grant public access (HLD_GCP_306)
data "google_iam_policy" "pubsub_fail" {
  binding {
    role    = "roles/pubsub.publisher"
    members = ["allUsers"]
  }
}

resource "google_pubsub_topic_iam_policy" "fail" {
  topic       = google_pubsub_topic.iam_fail.name
  project     = "gcp-bridgecrew-deployment"
  policy_data = data.google_iam_policy.pubsub_fail.policy_data
}
