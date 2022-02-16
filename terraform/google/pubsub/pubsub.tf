# fails
# Ensure PubSub Topics are encrypted with Customer Supplied Encryption Keys (CSEK)Checkov (CKV_GCP_83)
# todo dead letter topic
resource "google_pubsub_topic" "fail" {
  name = "example-topic"
  # kms_key_name = google_kms_crypto_key.crypto_key.id
}
