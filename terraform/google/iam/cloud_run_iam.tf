resource "google_cloud_run_v2_service" "fail" {
  name     = "iam-fail-run-service"
  location = "us-central1"
  project  = "gcp-bridgecrew-deployment"

  template {
    containers {
      image = "gcr.io/my-project/app"
    }
  }
}

# fail
# Default and built-in service accounts must not be used in IAM bindings (HLD_GCP_210)
resource "google_cloud_run_service_iam_member" "fail" {
  project  = "gcp-bridgecrew-deployment"
  location = google_cloud_run_v2_service.fail.location
  service  = google_cloud_run_v2_service.fail.name
  role     = "roles/run.invoker"
  member   = "serviceAccount:123456789012-compute@developer.gserviceaccount.com"
}

# fail
# Default and built-in service accounts must not be used in IAM bindings (HLD_GCP_210)
resource "google_cloud_run_v2_service_iam_binding" "fail" {
  project  = "gcp-bridgecrew-deployment"
  location = google_cloud_run_v2_service.fail.location
  name     = google_cloud_run_v2_service.fail.name
  role     = "roles/run.invoker"
  members  = ["serviceAccount:123456789012-compute@developer.gserviceaccount.com"]
}

# fail
# Default and built-in service accounts must not be used in IAM bindings (HLD_GCP_210)
resource "google_cloud_run_v2_service_iam_member" "fail" {
  project  = "gcp-bridgecrew-deployment"
  location = google_cloud_run_v2_service.fail.location
  name     = google_cloud_run_v2_service.fail.name
  role     = "roles/run.invoker"
  member   = "serviceAccount:123456789012-compute@developer.gserviceaccount.com"
}
