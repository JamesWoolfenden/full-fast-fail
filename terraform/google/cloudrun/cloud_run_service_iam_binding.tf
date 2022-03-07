# fail
# Ensure that GCP Cloud Run services are not anonymously or publicly accessibleCheckov (CKV_GCP_102)
resource "google_cloud_run_service_iam_binding" "fail1" {
  location = google_cloud_run_service.default.location
  service  = google_cloud_run_service.default.name
  role     = "roles/viewer"
  members = [
    "allAuthenticatedUsers",
  ]
}
