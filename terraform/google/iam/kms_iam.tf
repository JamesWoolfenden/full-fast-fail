resource "google_kms_key_ring" "fail" {
  name     = "iam-fail-keyring"
  location = "us-central1"
  project  = "gcp-bridgecrew-deployment"
}

resource "google_kms_crypto_key" "fail" {
  name     = "iam-fail-key"
  key_ring = google_kms_key_ring.fail.id

  lifecycle {
    prevent_destroy = false
  }
}

# fail
# Default and built-in service accounts must not be used in IAM bindings (HLD_GCP_210)
resource "google_kms_crypto_key_iam_binding" "fail" {
  crypto_key_id = google_kms_crypto_key.fail.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  members       = ["serviceAccount:123456789012-compute@developer.gserviceaccount.com"]
}

# fail
# KMS crypto key roles should be granted on the key, not the key ring or project (HLD_GCP_259)
# Default and built-in service accounts must not be used in IAM bindings (HLD_GCP_210)
resource "google_kms_key_ring_iam_binding" "fail" {
  key_ring_id = google_kms_key_ring.fail.id
  role        = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  members     = ["serviceAccount:123456789012-compute@developer.gserviceaccount.com"]
}

# fail
# KMS crypto key roles should be granted on the key, not the key ring or project (HLD_GCP_259)
# Default and built-in service accounts must not be used in IAM bindings (HLD_GCP_210)
resource "google_kms_key_ring_iam_member" "fail" {
  key_ring_id = google_kms_key_ring.fail.id
  role        = "roles/cloudkms.cryptoKeyDecrypter"
  member      = "serviceAccount:123456789012-compute@developer.gserviceaccount.com"
}
