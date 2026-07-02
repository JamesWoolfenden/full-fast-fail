# fail
# Cloud Run services must restrict ingress traffic (HLD_GCP_125)
# Cloud Run services must configure VPC access (HLD_GCP_126)
# Cloud Run services should encrypt container instances with a customer-managed key (HLD_GCP_127)
# Cloud Run services must enforce Binary Authorization (HLD_GCP_167)
# Cloud Run services must not use the default Compute Engine service account (HLD_GCP_084)
# Cloud Run container images should not use :latest tags (HLD_GCP_200)
resource "google_cloud_run_v2_service" "fail" {
  name     = "run-service-fail"
  location = "us-central1"
  project  = "gcp-bridgecrew-deployment"

  ingress = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      image = "gcr.io/my-project/app:latest"
    }
  }
}

# fail
# Cloud Run services must not allow unauthenticated invocations (HLD_GCP_023)
resource "google_cloud_run_v2_service_iam_member" "fail" {
  location = google_cloud_run_v2_service.fail.location
  name     = google_cloud_run_v2_service.fail.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}

# fail
# Cloud Run services must not allow unauthenticated invocations (HLD_GCP_023)
resource "google_cloud_run_v2_service_iam_binding" "fail" {
  location = google_cloud_run_v2_service.fail.location
  name     = google_cloud_run_v2_service.fail.name
  role     = "roles/run.invoker"
  members  = ["allUsers"]
}
