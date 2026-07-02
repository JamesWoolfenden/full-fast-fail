resource "google_cloudfunctions_function" "fail" {
  name        = "iam-fail-function-v1"
  runtime     = "nodejs20"
  entry_point = "helloWorld"
  region      = "us-central1"
  project     = "gcp-bridgecrew-deployment"

  source_archive_bucket = "my-bucket"
  source_archive_object = "function-source.zip"

  trigger_http = true
}

# fail
# Default and built-in service accounts must not be used in IAM bindings (HLD_GCP_210)
resource "google_cloudfunctions_function_iam_binding" "fail" {
  project        = "gcp-bridgecrew-deployment"
  region         = google_cloudfunctions_function.fail.region
  cloud_function = google_cloudfunctions_function.fail.name
  role           = "roles/cloudfunctions.invoker"
  members        = ["serviceAccount:123456789012-compute@developer.gserviceaccount.com"]
}

# fail
# Default and built-in service accounts must not be used in IAM bindings (HLD_GCP_210)
resource "google_cloudfunctions_function_iam_member" "fail" {
  project        = "gcp-bridgecrew-deployment"
  region         = google_cloudfunctions_function.fail.region
  cloud_function = google_cloudfunctions_function.fail.name
  role           = "roles/cloudfunctions.invoker"
  member         = "serviceAccount:123456789012-compute@developer.gserviceaccount.com"
}

resource "google_cloudfunctions2_function" "fail" {
  name     = "iam-fail-function-v2"
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
  }
}

# fail
# Default and built-in service accounts must not be used in IAM bindings (HLD_GCP_210)
resource "google_cloudfunctions2_function_iam_binding" "fail" {
  project        = "gcp-bridgecrew-deployment"
  location       = google_cloudfunctions2_function.fail.location
  cloud_function = google_cloudfunctions2_function.fail.name
  role           = "roles/cloudfunctions.invoker"
  members        = ["serviceAccount:123456789012-compute@developer.gserviceaccount.com"]
}

# fail
# Default and built-in service accounts must not be used in IAM bindings (HLD_GCP_210)
resource "google_cloudfunctions2_function_iam_member" "fail" {
  project        = "gcp-bridgecrew-deployment"
  location       = google_cloudfunctions2_function.fail.location
  cloud_function = google_cloudfunctions2_function.fail.name
  role           = "roles/cloudfunctions.invoker"
  member         = "serviceAccount:123456789012-compute@developer.gserviceaccount.com"
}
