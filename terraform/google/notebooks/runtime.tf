# fail
# Vertex AI Notebooks runtimes must use customer-managed encryption (HLD_GCP_234)
# Vertex AI Notebooks runtimes must disable external IP addresses (HLD_GCP_235)
resource "google_notebooks_runtime" "fail" {
  name     = "runtime-fail"
  location = "us-central1"
  project  = "gcp-bridgecrew-deployment"

  virtual_machine {
    virtual_machine_config {
      machine_type     = "e2-standard-4"
      internal_ip_only = false

      data_disk {
        initialize_params {
          disk_size_gb = 100
          disk_type    = "PD_STANDARD"
        }
      }
    }
  }
}
