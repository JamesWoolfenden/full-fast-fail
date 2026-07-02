# fail
# App Engine domain mappings must use managed SSL certificates (HLD_GCP_311)
resource "google_app_engine_domain_mapping" "fail" {
  domain_name = "www.example.com"
  project     = "gcp-bridgecrew-deployment"

  ssl_settings {
    ssl_management_type = "MANUAL"
  }
}
