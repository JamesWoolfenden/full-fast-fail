# fails

# Check: CKV_GCP_35: "Ensure 'Enable connecting to serial ports' is not enabled for VM Instance"

# CKV_GCP_31: "Ensure that instances are not configured to use the default service account with full access to all Cloud APIs"
# CKV_GCP_32: "Ensure 'Block Project-wide SSH keys' is enabled for VM instances"
# CKV_GCP_34: "Ensure that no instance in the project overrides the project setting for enabling OSLogin(OSLogin needs to be enabled in project metadata for all instances)"
# CKV_GCP_38: "Ensure VM disks for critical VMs are encrypted with Customer Supplied Encryption Keys (CSEK)"
# CKV_GCP_30: "Ensure that instances are not configured to use the default service account"
# CKV_GCP_39: "Ensure Compute instances are launched with Shielded VM enabled"
# CKV_GCP_40: "Ensure that Compute instances do not have public IP addresses"

resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"
  boot_disk {}
  service_account {
    scopes = ["https://www.googleapis.com/auth/cloud-platform", "compute-ro", "storage-ro"]
  }
  access_config {
    network_tier = "STANDARD"
  }
  metadata = {
    serial-port-enable = true
    enable-oslogin     = false
  }
  can_ip_forward = true
}
