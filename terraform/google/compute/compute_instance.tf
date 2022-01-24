# fails
# CKV_GCP_30: "Ensure that instances are not configured to use the default service account"
# CKV_GCP_31: "Ensure that instances are not configured to use the default service account with full access to all Cloud APIs"
# CKV_GCP_32: "Ensure 'Block Project-wide SSH keys' is enabled for VM instances"
# CKV_GCP_34: "Ensure that no instance in the project overrides the project setting for enabling OSLogin(OSLogin needs to be enabled in project metadata for all instances)"
# CKV_GCP_35: "Ensure 'Enable connecting to serial ports' is not enabled for VM Instance"
# CKV_GCP_36: "Ensure that IP forwarding is not enabled on Instances"
# CKV_GCP_38: "Ensure VM disks for critical VMs are encrypted with Customer Supplied Encryption Keys (CSEK)"
# CKV_GCP_39: "Ensure Compute instances are launched with Shielded VM enabled"
# CKV_GCP_40: "Ensure that Compute instances do not have public IP addresses" access_config is inside of network_interface
# CKV_GCP_36: "Ensure that IP forwarding is not enabled on Instances"
# todo  has shielded_instance_config.enable_vtpm set to false  enables advanced protection capabilities
# todo no-plaintext-vm-disk-keys e.g. disk_encryption_key_raw is set

# tfsec
# google-compute-no-project-wide-ssh-keys
# google-compute-no-default-service-account
# google-compute-no-ip-forwarding
# google-compute-no-oslogin-override
# google-compute-vm-disk-encryption-customer-key
# google-compute-no-serial-port
# google-compute-enable-shielded-vm
# no-plaintext-vm-disk-keys
# google-compute-no-public-ip

resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
    disk_encryption_key_raw = "something"
  }

  service_account {
    scopes = ["https://www.googleapis.com/auth/cloud-platform", "compute-ro", "storage-ro"]
  }

network_interface {
  network = "default"
  access_config {
    network_tier = "STANDARD"
  }
}
  metadata = {
    block-project-ssh-keys = false
    serial-port-enable     = true
    enable-oslogin         = false
  }

  can_ip_forward   = true
  enable_flow_logs = false
  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = "1234567890-compute@developer.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
  shielded_instance_config {
    enable_vtpm                 = false
    enable_integrity_monitoring = false
  }
}
