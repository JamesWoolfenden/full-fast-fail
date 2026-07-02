# fail
# GCP network attachments must not use automatic connection acceptance (HLD_GCP_314)
resource "google_compute_network_attachment" "fail" {
  name                  = "network-attachment-fail"
  project               = "gcp-bridgecrew-deployment"
  region                = "us-central1"
  connection_preference = "ACCEPT_AUTOMATIC"

  subnetworks = [
    google_compute_subnetwork.attachment_fail.self_link,
  ]
}

resource "google_compute_subnetwork" "attachment_fail" {
  name          = "subnet-attachment-fail"
  project       = "gcp-bridgecrew-deployment"
  region        = "us-central1"
  ip_cidr_range = "10.10.0.0/24"
  network       = google_compute_network.attachment_fail.id
}

resource "google_compute_network" "attachment_fail" {
  name                    = "network-for-attachment-fail"
  project                 = "gcp-bridgecrew-deployment"
  auto_create_subnetworks = false
}
