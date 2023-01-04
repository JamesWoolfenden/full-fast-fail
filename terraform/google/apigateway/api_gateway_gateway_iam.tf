data "google_iam_policy" "admin" {
  provider = google-beta
  binding {
    role = "roles/apigateway.viewer"
    members = [
      "user:jane@example.com",
    ]
  }
}

resource "google_api_gateway_gateway_iam_policy" "policy" {
  provider    = google-beta
  project     = google_api_gateway_gateway.api_gw.project
  region      = google_api_gateway_gateway.api_gw.region
  gateway     = google_api_gateway_gateway.api_gw.gateway_id
  policy_data = data.google_iam_policy.admin.policy_data
}

resource "google_api_gateway_gateway_iam_binding" "binding" {
  provider = google-beta
  project  = google_api_gateway_gateway.api_gw.project
  region   = google_api_gateway_gateway.api_gw.region
  gateway  = google_api_gateway_gateway.api_gw.gateway_id
  role     = "roles/apigateway.viewer"
  members = [
    "user:jane@example.com",
  ]
}

resource "google_api_gateway_gateway_iam_member" "member" {
  provider = google-beta
  project  = google_api_gateway_gateway.api_gw.project
  region   = google_api_gateway_gateway.api_gw.region
  gateway  = google_api_gateway_gateway.api_gw.gateway_id
  role     = "roles/apigateway.viewer"
  member   = "user:jane@example.com"
}
