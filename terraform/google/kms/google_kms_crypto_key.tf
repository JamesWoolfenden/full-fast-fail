# fails
# Ensure KMS encryption keys are rotated within a period of 90 daysCheckov CKV_GCP_43
# Ensure KMS keys are protected from deletionCheckov (CKV_GCP_82)
# Ensure that Cloud KMS cryptokeys are not anonymously or publicly accessibleCheckov CKV2_GCP_6
# tfsec
# google-kms-rotate-kms-keys
resource "google_kms_key_ring" "keyring" {
  name     = "keyring-example"
  location = "global"
}

resource "google_kms_crypto_key" "fails" {
  name            = "crypto-key-example"
  key_ring        = google_kms_key_ring.keyring.id
  rotation_period = "15552000s"

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_kms_crypto_key_iam_member" "bad_member_1" {
  crypto_key_id = google_kms_crypto_key.fails.id
  role          = "roles/cloudkms.cryptoKeyEncrypter"
  member        = "allUsers"
}
