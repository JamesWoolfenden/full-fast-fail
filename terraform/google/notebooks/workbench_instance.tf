# fail
# Vertex AI Workbench instances must use customer-managed encryption for boot disks (HLD_GCP_230)
# Vertex AI Workbench instances must disable public IP addresses (HLD_GCP_231)
resource "google_workbench_instance" "fail" {
  name     = "workbench-fail"
  location = "us-central1-a"
  project  = "gcp-bridgecrew-deployment"

  gce_setup {
    machine_type      = "e2-standard-4"
    disable_public_ip = false
  }
}
