
resource "google_compute_instance" "fail" {
  name         = "test"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  shielded_instance_config {
    enable_vtpm                 = false
    enable_integrity_monitoring = false
  }
}
