# fails
# todo check kms_key_name is set
# todo dead letter topic
resource "google_pubsub_topic" "fail" {
  name = "example-topic"
  # kms_key_name = google_kms_crypto_key.crypto_key.id
}
