resource "google_compute_instance" "fail" {
  name         = "iam-fail-instance"
  machine_type = "e2-medium"
  zone         = "us-central1-a"
  project      = "gcp-bridgecrew-deployment"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "default"
  }
}

# fail
# IAP tunnel instance IAM must not grant public access (HLD_GCP_077)
resource "google_iap_tunnel_instance_iam_binding" "fail" {
  project  = "gcp-bridgecrew-deployment"
  zone     = google_compute_instance.fail.zone
  instance = google_compute_instance.fail.name
  role     = "roles/iap.tunnelResourceAccessor"
  members  = ["allUsers"]
}

# fail
# IAP tunnel instance IAM must not grant public access (HLD_GCP_077)
resource "google_iap_tunnel_instance_iam_member" "fail" {
  project  = "gcp-bridgecrew-deployment"
  zone     = google_compute_instance.fail.zone
  instance = google_compute_instance.fail.name
  role     = "roles/iap.tunnelResourceAccessor"
  member   = "allAuthenticatedUsers"
}

resource "google_compute_backend_service" "fail" {
  name    = "iam-fail-backend-service"
  project = "gcp-bridgecrew-deployment"
}

# fail
# IAP web IAM bindings must not grant access to allUsers or allAuthenticatedUsers (HLD_GCP_186)
resource "google_iap_web_backend_service_iam_binding" "fail" {
  project             = "gcp-bridgecrew-deployment"
  web_backend_service = google_compute_backend_service.fail.name
  role                = "roles/iap.httpsResourceAccessor"
  members             = ["allUsers"]
}

# fail
# IAP web IAM bindings must not grant access to allUsers or allAuthenticatedUsers (HLD_GCP_186)
resource "google_iap_web_backend_service_iam_member" "fail" {
  project             = "gcp-bridgecrew-deployment"
  web_backend_service = google_compute_backend_service.fail.name
  role                = "roles/iap.httpsResourceAccessor"
  member              = "allAuthenticatedUsers"
}
