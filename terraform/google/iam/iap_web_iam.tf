# fail
# IAP web IAM bindings must not grant access to allUsers or allAuthenticatedUsers (HLD_GCP_186)
resource "google_iap_web_iam_binding" "fail" {
  project = "gcp-bridgecrew-deployment"
  role    = "roles/iap.httpsResourceAccessor"
  members = ["allUsers"]
}

# fail
# IAP web IAM bindings must not grant access to allUsers or allAuthenticatedUsers (HLD_GCP_186)
resource "google_iap_web_iam_member" "fail" {
  project = "gcp-bridgecrew-deployment"
  role    = "roles/iap.httpsResourceAccessor"
  member  = "allAuthenticatedUsers"
}

resource "google_cloud_run_v2_service" "iap_fail" {
  name     = "iam-fail-iap-run-service"
  location = "us-central1"
  project  = "gcp-bridgecrew-deployment"

  template {
    containers {
      image = "gcr.io/my-project/app"
    }
  }
}

# fail
# Cloud Run IAP IAM bindings must not grant public access (HLD_PROPOSED_013)
resource "google_iap_web_cloud_run_service_iam_binding" "fail" {
  project  = "gcp-bridgecrew-deployment"
  location = google_cloud_run_v2_service.iap_fail.location
  cloud_run_service {
    service = google_cloud_run_v2_service.iap_fail.name
  }
  role    = "roles/iap.httpsResourceAccessor"
  members = ["allUsers"]
}

# fail
# Cloud Run IAP IAM bindings must not grant public access (HLD_PROPOSED_013)
resource "google_iap_web_cloud_run_service_iam_member" "fail" {
  project  = "gcp-bridgecrew-deployment"
  location = google_cloud_run_v2_service.iap_fail.location
  cloud_run_service {
    service = google_cloud_run_v2_service.iap_fail.name
  }
  role   = "roles/iap.httpsResourceAccessor"
  member = "allAuthenticatedUsers"
}
