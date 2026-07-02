# fail
# Cloud Functions should use a customer-managed encryption key (HLD_GCP_086)
# Cloud Functions must set a non-zero max_instances limit (HLD_GCP_287)
# Cloud Functions 1st gen (google_cloudfunctions_function) is deprecated — migrate to v2 (HLD_GCP_288)
# Cloud Functions must restrict ingress to internal traffic only (HLD_GCP_021)
# Cloud Functions must not use the default Compute Engine service account (HLD_GCP_179)
# Cloud Functions must configure a VPC connector for egress (HLD_GCP_157)
resource "google_cloudfunctions_function" "fail" {
  name        = "function-v1-fail"
  runtime     = "nodejs20"
  entry_point = "helloWorld"
  region      = "us-central1"
  project     = "gcp-bridgecrew-deployment"

  source_archive_bucket = "my-bucket"
  source_archive_object = "function-source.zip"

  trigger_http          = true
  ingress_settings      = "ALLOW_ALL"
  max_instances         = 0
  service_account_email = "123456789012-compute@developer.gserviceaccount.com"
}

# fail
# Cloud Functions IAM members must not grant access to allUsers or allAuthenticatedUsers (HLD_GCP_085)
resource "google_cloudfunctions_function_iam_binding" "fail" {
  project        = "gcp-bridgecrew-deployment"
  region         = google_cloudfunctions_function.fail.region
  cloud_function = google_cloudfunctions_function.fail.name
  role           = "roles/cloudfunctions.invoker"
  members        = ["allUsers"]
}

# fail
# Cloud Functions IAM members must not grant access to allUsers or allAuthenticatedUsers (HLD_GCP_085)
resource "google_cloudfunctions_function_iam_member" "fail" {
  project        = "gcp-bridgecrew-deployment"
  region         = google_cloudfunctions_function.fail.region
  cloud_function = google_cloudfunctions_function.fail.name
  role           = "roles/cloudfunctions.invoker"
  member         = "allUsers"
}
