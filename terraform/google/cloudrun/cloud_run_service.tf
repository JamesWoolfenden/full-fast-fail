# fail
# Cloud Run services must not use the default Compute Engine service account (HLD_GCP_084)
resource "google_cloud_run_service" "fail" {
  name     = "run-service-v1-fail"
  location = "us-central1"
  project  = "gcp-bridgecrew-deployment"

  template {
    spec {
      containers {
        image = "gcr.io/my-project/app:v1"
      }
      service_account_name = "123456789012-compute@developer.gserviceaccount.com"
    }
  }
}

# fail
# Cloud Run services must not allow unauthenticated invocations (HLD_GCP_023)
resource "google_cloud_run_service_iam_member" "fail" {
  location = google_cloud_run_service.fail.location
  project  = google_cloud_run_service.fail.project
  service  = google_cloud_run_service.fail.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}
