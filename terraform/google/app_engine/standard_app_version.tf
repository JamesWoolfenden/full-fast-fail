# fail
# App Engine versions must set an explicit, non-default service account (HLD_GCP_189)
resource "google_app_engine_standard_app_version" "fail" {
  project    = "gcp-bridgecrew-deployment"
  service    = "standard-service-fail"
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

  service_account = "gcp-bridgecrew-deployment@appspot.gserviceaccount.com"

  noop_on_destroy = true
}
