# fail
# Cloud Functions should use a customer-managed encryption key (HLD_GCP_086)
# Cloud Functions must restrict ingress to internal traffic only (HLD_GCP_021)
# Cloud Functions must not use the default Compute Engine service account (HLD_GCP_179)
# Cloud Functions must configure a VPC connector for egress (HLD_GCP_157)
resource "google_cloudfunctions2_function" "fail" {
  name     = "function-fail"
  location = "us-central1"
  project  = "gcp-bridgecrew-deployment"

  build_config {
    runtime     = "nodejs20"
    entry_point = "helloWorld"
    source {
      storage_source {
        bucket = "my-bucket"
        object = "function-source.zip"
      }
    }
  }

  service_config {
    max_instance_count = 1
    available_memory   = "256M"
    timeout_seconds    = 60
    ingress_settings   = "ALLOW_ALL"
  }
}

# fail
# Cloud Functions IAM members must not grant access to allUsers or allAuthenticatedUsers (HLD_GCP_085)
resource "google_cloudfunctions2_function_iam_binding" "fail" {
  project        = "gcp-bridgecrew-deployment"
  location       = google_cloudfunctions2_function.fail.location
  cloud_function = google_cloudfunctions2_function.fail.name
  role           = "roles/cloudfunctions.invoker"
  members        = ["allUsers"]
}

# fail
# Cloud Functions IAM members must not grant access to allUsers or allAuthenticatedUsers (HLD_GCP_085)
resource "google_cloudfunctions2_function_iam_member" "fail" {
  project        = "gcp-bridgecrew-deployment"
  location       = google_cloudfunctions2_function.fail.location
  cloud_function = google_cloudfunctions2_function.fail.name
  role           = "roles/cloudfunctions.invoker"
  member         = "allUsers"
}
