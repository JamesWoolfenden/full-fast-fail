
            resource "google_kms_crypto_key" "key" {
              name            = "crypto-key-example"
              key_ring        = google_kms_key_ring.keyring.id
              lifecycle {
                prevent_destroy = true
              }
            }
