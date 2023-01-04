data "google_iam_policy" "admin" {
  provider = google-beta
  binding {
    role = "roles/apigateway.viewer"
    members = [
      "user:jane@example.com",
    ]
  }
}

resource "google_api_gateway_api_iam_policy" "policy" {
  provider    = google-beta
  project     = google_api_gateway_api.api.project
  api         = google_api_gateway_api.api.api_id
  policy_data = data.google_iam_policy.admin.policy_data
}
