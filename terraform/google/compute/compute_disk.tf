# fails
# CKV_GCP_37: "Ensure VM disks for critical VMs are encrypted with Customer Supplied Encryption Keys (CSEK)"
# todo no plain text raw_keys

# tfsec
# google-compute-disk-encryption-customer-key
# google-compute-disk-encryption-customer-keys -duplicate?
# no-plaintext-disk-keys
resource "google_compute_disk" "default" {
  name                      = "test-disk"
  type                      = "pd-ssd"
  zone                      = "us-central1-a"
  image                     = "debian-8-jessie-v20170523"
  physical_block_size_bytes = 4096
  disk_encryption_key {
    raw_key = "something"
  }
}
