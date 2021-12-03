
                resource "google_storage_bucket" "static-site" {
                  name          = "image-store.com"
                  location      = "EU"
                  force_destroy = true
                  logging {
                    log_bucket="image-store.com"
                  }
                }
