# fail
# GCE instances must not enable IP forwarding (HLD_GCP_075)
# GCE instances must enable Shielded VM Integrity Monitoring (HLD_GCP_148)
# GCE instance templates must use a customer-managed encryption key for the boot disk (HLD_GCP_187)
# GCE instances must not use the default VPC network (HLD_GCP_091)
# GCE instances must block project-wide SSH keys (HLD_GCP_064)
# GCE instances must not have external IP addresses (HLD_GCP_005)
# GCE instances must not have serial port access enabled (HLD_GCP_007)
# GCE instances must have OS Login enabled (HLD_GCP_008)
# GCE instances must enable Secure Boot (HLD_GCP_089)
# GCE instances must enable Shielded VM features (HLD_GCP_006)
resource "google_compute_instance_template" "fail" {
  name         = "instance-template-fail"
  project      = "gcp-bridgecrew-deployment"
  machine_type = "n1-standard-1"

  can_ip_forward = true

  disk {
    source_image = "debian-cloud/debian-12"
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network = "default"

    access_config {
      network_tier = "STANDARD"
    }
  }

  metadata = {
    block-project-ssh-keys = "false"
    serial-port-enable     = "true"
    enable-oslogin         = "false"
  }

  shielded_instance_config {
    enable_secure_boot          = false
    enable_vtpm                 = false
    enable_integrity_monitoring = false
  }
}
