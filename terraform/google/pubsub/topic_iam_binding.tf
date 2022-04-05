# fails
# CKV_GCP_98: "Ensure that Dataproc clusters are not anonymously or publicly accessible"
resource "google_pubsub_topic_iam_binding" "fail1" {
  cluster = "my-public-topic-binding1"
  role    = "roles/pubsub.viewer"
  members = [
    "allAuthenticatedUsers",
  ]
}
