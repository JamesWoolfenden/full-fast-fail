# fail
# GCE disk snapshots must use a customer-managed encryption key (HLD_GCP_162)
resource "google_compute_snapshot" "fail" {
  name        = "snapshot-fail"
  project     = "gcp-bridgecrew-deployment"
  zone        = "us-central1-a"
  source_disk = google_compute_disk.snapshot_fail.name
}

resource "google_compute_disk" "snapshot_fail" {
  name    = "disk-for-snapshot-fail"
  project = "gcp-bridgecrew-deployment"
  zone    = "us-central1-a"
  image   = "debian-cloud/debian-12"
}
