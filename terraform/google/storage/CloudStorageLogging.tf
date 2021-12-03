
resource "google_storage_bucket" "logging" {
  name                        = "jgwloggingbucket"
  location                    = var.location
  uniform_bucket_level_access = true
}
