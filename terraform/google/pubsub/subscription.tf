# fails
# todo check dead_letter_policy is set
resource "google_pubsub_subscription" "example" {
  name  = "example-subscription"
  topic = google_pubsub_topic.example.name

  # dead_letter_policy {
  #   dead_letter_topic     = google_pubsub_topic.example_dead_letter.id
  #   max_delivery_attempts = 10
  # }
}
