# Fails
# CKV_GCP_86: "Ensure Cloud build workers are private"
resource "google_cloudbuild_worker_pool" "fail" {
  name     = "mylovelypool"
  project  = "examplea"
  location = "europe-west1"
  worker_config {
    disk_size_gb   = 100
    machine_type   = "e2-standard-4"
    no_external_ip = false
  }
}
