# fail
# Cloud Composer environments should use a customer-managed encryption key (HLD_GCP_159)
# Cloud Composer environments must use private IP networking (HLD_GCP_158)
# Cloud Composer environments should enable scheduled snapshots (HLD_GCP_100)
resource "google_composer_environment" "fail" {
  name    = "composer-fail"
  project = "gcp-bridgecrew-deployment"
  region  = "us-central1"

  config {
    software_config {
      image_version = "composer-2-airflow-2"
    }
  }
}
