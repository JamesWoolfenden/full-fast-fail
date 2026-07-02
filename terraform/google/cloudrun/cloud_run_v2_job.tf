# fail
# Cloud Run binary_authorization must enforce a policy, not only set breakglass_justification (HLD_GCP_283)
# Cloud Run v2 jobs must encrypt container instances with a customer-managed key (HLD_PROPOSED_011)
# Cloud Run v2 job container images should be pinned by digest (HLD_GCP_304)
# Cloud Run v2 jobs must not use the default Compute Engine service account (HLD_GCP_177)
# Cloud Run v2 job container images should not use :latest tags (HLD_GCP_265)
# Cloud Run v2 jobs must configure VPC access (HLD_GCP_176)
resource "google_cloud_run_v2_job" "fail" {
  name     = "run-job-fail"
  location = "us-central1"
  project  = "gcp-bridgecrew-deployment"

  binary_authorization {
    breakglass_justification = "emergency deploy"
  }

  template {
    template {
      containers {
        image = "gcr.io/my-project/job:latest"
      }
      service_account = "123456789012-compute@developer.gserviceaccount.com"
    }
  }
}
