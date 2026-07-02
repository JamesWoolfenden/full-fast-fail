# fail
# TPU v2 VMs must disable external IP addresses (HLD_GCP_239)
resource "google_tpu_v2_vm" "fail" {
  name    = "tpu-vm-fail"
  project = "gcp-bridgecrew-deployment"
  zone    = "us-central1-a"

  runtime_version = "tpu-vm-tf-2.15.0"

  accelerator_config {
    type     = "V2"
    topology = "2x2"
  }

  network_config {
    enable_external_ips = true
  }
}
