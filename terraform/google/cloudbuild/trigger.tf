# fail
# Cloud Build triggers must not use the default Cloud Build service account (HLD_GCP_191)
# Cloud Build triggers on pull requests must not allow comment-triggered builds (HLD_GCP_192)
resource "google_cloudbuild_trigger" "fail" {
  name     = "cloudbuild-trigger-fail"
  project  = "gcp-bridgecrew-deployment"
  location = "global"

  github {
    owner = "JamesWoolfenden"
    name  = "fail"
    pull_request {
      branch          = "^main$"
      comment_control = "COMMENTS_ENABLED"
    }
  }

  filename = "cloudbuild.yaml"
}
