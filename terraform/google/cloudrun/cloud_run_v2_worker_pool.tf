# fail
# Cloud Run v2 worker pools must encrypt container instances with a customer-managed key (HLD_PROPOSED_012)
resource "google_cloud_run_v2_worker_pool" "fail" {
  name     = "run-worker-pool-fail"
  location = "us-central1"
  project  = "gcp-bridgecrew-deployment"

  template {
    containers {
      image = "gcr.io/my-project/worker:v1"
    }
  }
}
