
            resource "google_compute_instance" "default" {
              name         = "test"
              machine_type = "n1-standard-1"
              zone         = "us-central1-a"
              boot_disk {}
              access_config {
                network_tier = "STANDARD"
                }
            }
