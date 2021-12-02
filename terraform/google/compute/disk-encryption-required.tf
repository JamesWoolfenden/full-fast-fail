

resource "google_compute_disk" "good_example" {
  disk_encryption_key {
    raw_key = "b2ggbm8gdGhpcyBpcyBiYWQ="
  }
}
