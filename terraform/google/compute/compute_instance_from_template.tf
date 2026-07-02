# fail
# GCE instances must not use the cloud-platform OAuth scope (HLD_GCP_076)
# GCE instances must not use the default service account (HLD_GCP_038)
resource "google_compute_instance_from_template" "fail" {
  name    = "instance-from-template-fail"
  project = "gcp-bridgecrew-deployment"
  zone    = "us-central1-a"

  source_instance_template = google_compute_instance_template.fail.self_link_unique

  service_account {
    email  = "123456789012-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}
