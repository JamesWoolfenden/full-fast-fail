data "google_iam_policy" "admin" {
  provider = google-beta
  binding {
    role = "roles/apigateway.viewer"
    members = [
      "user:jane@example.com",
    ]
  }
}

resource "google_api_gateway_api_config_iam_policy" "policy" {
  provider    = google-beta
  api         = google_api_gateway_api_config.api_cfg.api
  api_config  = google_api_gateway_api_config.api_cfg.api_config_id
  policy_data = data.google_iam_policy.admin.policy_data
}

resource "google_api_gateway_api_config_iam_binding" "binding" {
  provider   = google-beta
  api        = google_api_gateway_api_config.api_cfg.api
  api_config = google_api_gateway_api_config.api_cfg.api_config_id
  role       = "roles/apigateway.viewer"
  members = [
    "user:jane@example.com",
  ]
}

resource "google_api_gateway_api_config_iam_member" "member" {
  provider   = google-beta
  api        = google_api_gateway_api_config.api_cfg.api
  api_config = google_api_gateway_api_config.api_cfg.api_config_id
  role       = "roles/apigateway.viewer"
  member     = "user:jane@example.com"
}
