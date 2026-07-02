# fail
# App Engine flexible environments must not use the default Compute Engine service account (HLD_GCP_174)
# App Engine flexible environments must configure VPC access (HLD_GCP_175)
# App Engine versions must set an explicit, non-default service account (HLD_GCP_189)
resource "google_app_engine_flexible_app_version" "fail" {
  project    = "gcp-bridgecrew-deployment"
  service    = "flex-service-fail"
  version_id = "v1"
  runtime    = "nodejs20"

  entrypoint {
    shell = "node app.js"
  }

  deployment {
    zip {
      source_url = "https://storage.googleapis.com/my-bucket/app.zip"
    }
  }

  liveness_check {
    path = "/healthz"
  }

  readiness_check {
    path = "/healthz"
  }

  service_account = "123456789012-compute@developer.gserviceaccount.com"

  noop_on_destroy = true
}
