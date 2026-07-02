resource "google_kms_key_ring" "fail" {
  name     = "kms-fail-keyring"
  location = "us-central1"
  project  = "gcp-bridgecrew-deployment"
}

resource "google_kms_crypto_key" "fail" {
  name     = "kms-fail-key"
  key_ring = google_kms_key_ring.fail.id

  lifecycle {
    prevent_destroy = false
  }
}

# fail
# KMS crypto key IAM members must not grant access to allUsers or allAuthenticatedUsers (HLD_GCP_069)
resource "google_kms_crypto_key_iam_binding" "fail" {
  crypto_key_id = google_kms_crypto_key.fail.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  members       = ["allUsers"]
}

# fail
# KMS key ring IAM must not grant access to allUsers or allAuthenticatedUsers (HLD_GCP_073)
resource "google_kms_key_ring_iam_binding" "fail" {
  key_ring_id = google_kms_key_ring.fail.id
  role        = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  members     = ["allUsers"]
}

# fail
# KMS key ring IAM must not grant access to allUsers or allAuthenticatedUsers (HLD_GCP_073)
resource "google_kms_key_ring_iam_member" "fail" {
  key_ring_id = google_kms_key_ring.fail.id
  role        = "roles/cloudkms.cryptoKeyDecrypter"
  member      = "allUsers"
}
